#include <ESP8266WiFi.h>
#include <ESP8266WiFiMulti.h>
#include <ESP8266HTTPClient.h>
#include <ESP8266WebServer.h>
#include <ESP8266mDNS.h>
#include <ESP8266Ping.h>
#include <Ticker.h>
#include <AccelStepper.h>

#include "credentials.h"
#include "settings.h"
#include "OTA.h"

ESP8266WiFiMulti  WiFiMulti;
ESP8266WebServer  server(80);
Ticker            ticker;
AccelStepper      stepper(AccelStepper::DRIVER, STEPPER_STEP, STEPPER_DIR);
 
void setup() {
  Serial.begin(115200);
  delay(300);

  Serial.println();
  Serial.println("Setting inputs/outputs...");
  Serial.println();
  
  pinMode(BTN, INPUT);
  pinMode(LED, OUTPUT);
  pinMode(STEPPER_STEP, OUTPUT);
  pinMode(STEPPER_DIR, OUTPUT);
  pinMode(STEPPER_ENABLE, OUTPUT);
   
  digitalWrite(STEPPER_STEP, LOW);
  digitalWrite(STEPPER_DIR, LOW);
  digitalWrite(LED, LOW);
  enableMotor(false);
  
  Serial.println();
  Serial.println("Starting ticker...");
  Serial.println();
  ticker.attach(1, loopCount);

  Serial.println();
  Serial.println("Initializing stepper...");
  Serial.println();
  stepper.setAcceleration(80);
  stepper.setMaxSpeed(maxMotorSpeed);
  
  Serial.println("");
  startWIFI();
  handleOTASetup();
  startWebserver();

  Serial.println();
  Serial.println("Homing");
  homingMode = true;
  Serial.println();
}


/**
 * Wrapper for more ease moving 
 * the motor
 */
void moveDeg(int deg) {
  // 360° = 466 * 8 = 3728 steps
  int steps = 466 * 8 / 360;
  steps = steps * deg;
  Serial.println(steps);
  stepper.move(steps);
}


/**
 * Homing the whole platform
 * Handling when state is in "homing"-mode.
 */
void homePlatform() {
  enableMotor(true);

  switch(homingModeStep) {
    case 0:
      digitalWrite(LED, HIGH);
      stepper.setSpeed(maxMotorSpeed);
      moveDeg(10);
      homingModeStep++;
      break;

    case 1:
      if(!stepper.isRunning()) {
        digitalWrite(LED, LOW);
        moveDeg(-180);
        homingModeStep++;
      }
      break;

    case 2:
      if(!digitalRead(BTN)) {
        stepper.setAcceleration(avgAccSpeed * 2);
        stepper.stop();
        homingModeStep++;
      }
      break;

    case 3:
      if(!stepper.isRunning()) {
        stepper.setAcceleration(avgAccSpeed);
        digitalWrite(LED, HIGH);
        moveDeg(60);
        homingModeStep++;
      }
    break;

    case 4:
      if(!stepper.isRunning()) {
        digitalWrite(LED, LOW);
        stepper.disableOutputs();
        enableMotor(false);
        homingModeStep = 99;
        homingMode = false;
        Serial.println("Successfully homed!");
      }
    break;
  }
}


/**
 * Playing moving pattern
 * Handling when state is in "patternActive"-mode.
 */
void playPattern() {
  enableMotor(true);

  switch(patternStep) {
    case 0:
      moveDeg(60);
      patternStep++;
      break;

    case 1:
      if(!stepper.isRunning()) {
        moveDeg(-125);
        patternStep++;
      }
      break;

    case 2:
      if(!digitalRead(BTN)) {
        stepper.setAcceleration(avgAccSpeed * 2);
        stepper.stop();
        patternStep++;
      }
      break;

    case 3:
      if(!stepper.isRunning()) {
        stepper.setAcceleration(avgAccSpeed);
        moveDeg(120);
        if(patternLoop < patternRepeats) {
          patternLoop++;
          patternStep = 1;
        } else {
          patternStep++;
        }
      }
    break;

  case 4:
    if(!stepper.isRunning()) {
      moveDeg(-60);
      patternStep++;
    }
    break;

    case 5:
      if(!stepper.isRunning()) {
        stepper.disableOutputs();
        enableMotor(false);
        patternStep = 0;
        patternLoop = 0;
        patternLed = 0;
        ledActive = false;
        digitalWrite(LED, ledActive);
        patternActive = false;
        Serial.println("Successfully end pattern!");
      }
    break;
  }
}


/**
 * Switching led on/off if x ms passed
 */
void handleLed() {
  if(patternLed > 0 && lastHitMillis < millis() && millis() % 1000 == 0) {
    lastHitMillis = millis();
    ledActive = !ledActive;
    digitalWrite(LED, ledActive);
  }
}


/**
   Handles pinging (send alive)
   to server
*/
void handlePing() {
  if (pingCnt > handlePingSecs) {
    Serial.println("Start pinging.");
    bool result = Ping.ping("www.google.com");

    if (!result) {
      Serial.println("Ping failed!");
    }

    Serial.println("[HTTP] end ping-pong.");
    Serial.println("---");
    pingCnt = 0;
  }
}


/**
 * Preparing movePattern by parsing and setting 
 * all params given by request
 */
void startMovePattern(uint8_t speed, uint8_t repeats, uint8_t led) {
  server.send(200, "text/plain", "Start movement.");
  patternActive = true;

  patternSpeed = patternSpeedFallback;
  if(speed > 0) patternSpeed = speed;
  if(speed > maxMotorSpeed) patternSpeed = maxMotorSpeed;

  patternRepeats = patternRepeatsFallback;
  if(repeats > 0) patternRepeats = repeats;
  
  patternLed = patternLedFallback;
  if(led > 0) patternLed = led;
  
  Serial.println("Start da movement");
}


/**
   Start webserver for handling
   incoming requests
*/
void startWebserver() {
  Serial.println("Starting HTTP-Server...");
  Serial.println("-- Registering routes.");
  server.on("/pattern", HTTP_GET, []() {
    String speed = server.arg("speed");
    String repeats = server.arg("repeats");
    String led = server.arg("led");
    startMovePattern(speed.toInt(), repeats.toInt(), led.toInt());
  });
  server.onNotFound(handleRequestNotFound);
  Serial.println("-- Launching server ...");
  server.begin();
  Serial.println("-- DONE.");
}


/**
   Start or reconnect the wifi
   by switching into an infinite loop
   as long as the connection is broken
*/
void startWIFI() {
  int loopcnt = 0;
  Serial.println("---");
  WiFi.mode(WIFI_STA);
  Serial.println("Connecting WIFI.");
  Serial.println("(Re)Connecting to Wifi-Network with following credentials:");
  Serial.print("SSID: ");
  //Serial.println(WifiCredentials[0].c_str());
  Serial.print("Key: ");
  //Serial.println(WifiCredentials[1].c_str());
  WiFi.hostname(espName);
  WiFiMulti.addAP(WifiCredentials[0].c_str(), WifiCredentials[1].c_str());

  while (WiFiMulti.run() != WL_CONNECTED) {
    loopcnt++;
    if(loopcnt < 10) {
      Serial.print(".");
    }
    delay(500);
  }

  Serial.println("");
  Serial.println("WiFi connected.");
  Serial.println("IP address:");
  Serial.println(WiFi.localIP().toString());
}


/**
   Tick, tick, tick
*/
void loopCount() {
  loopCnt++;
  pingCnt++;
}


/**
 * DA MAINLOOP
 */
void loop() {
   //(re)connect wifi if not connected
  if (WiFiMulti.run() != WL_CONNECTED) {
    delay(1);
    startWIFI();
    return;
  }

  stepper.run();

  if(homingMode) {
    homePlatform();
    return;  
  }

  if(patternActive) {
    playPattern();
    handleLed();
    return;
  }

  if(stepper.isRunning()) {
    return;
  }
  
  ArduinoOTA.handle();
  handlePing();
  server.handleClient();
   
}


/**
 * Wrapper for handling the motor more 
 * intuitively
 */
void enableMotor(boolean enable) {
  digitalWrite(STEPPER_ENABLE, !enable);
}


/**
   Unknown Route
   Send "teapot".
*/
void handleRequestNotFound() {
  server.send(418, "text/plain", "I'm a piranha-plant. Chhhrrapppp! Chhhrrapppp!");
}
