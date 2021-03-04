#define BTN             D5 //Button
#define LED             D8 //LED
#define STEPPER_STEP    D6 //Step
#define STEPPER_DIR     D7 //Direction
#define STEPPER_ENABLE  D0 //Enable 

//Interval to ping server in seconds (to avoid losing wifi)
int handlePingSecs = 120;

int maxMotorSpeed = 500; //Maximum speed of motor
int avgAccSpeed   = 900; //Normal acceleration speed 

boolean patternLedFallback = 0; //Fallback if no led-option was send via request
uint8_t patternRepeatsFallback = 3; //Fallback if no repeat-option was send via request
uint8_t patternSpeedFallback = 500; //Fallback if no speed-option was send via request

//Hostname of your esp
const char* espName = "esp8266-studio-piranha-plant"; 

//Internal settings. 
//Don't change anything below (except you really know what you're doing).

int loopCnt = 0;
int pingCnt = 0;

boolean homingMode = false;
int homingModeStep = 0;

bool ledActive     = false;
bool patternActive = false;
int patternRepeats = 0;
int patternSpeed   = 0;
int patternLed     = 0;
int patternStep    = 0;
int patternLoop    = 0;
int lastHitMillis  = 0;
