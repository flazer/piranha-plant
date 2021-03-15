EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L MCU_Module:WeMos_D1_mini U2
U 1 1 603B6987
P 3900 2450
F 0 "U2" H 3650 3200 50  0000 C CNN
F 1 "WeMos_D1_mini" V 3550 2050 50  0000 C CNN
F 2 "Module:WEMOS_D1_mini_light" H 3900 1300 50  0001 C CNN
F 3 "https://wiki.wemos.cc/products:d1:d1_mini#documentation" H 2050 1300 50  0001 C CNN
	1    3900 2450
	1    0    0    -1  
$EndComp
Wire Wire Line
	6850 3450 6850 2900
Wire Wire Line
	6950 2900 6950 3450
Wire Wire Line
	3900 3250 3900 3450
Wire Wire Line
	3900 3450 4450 3450
Connection ~ 6850 3450
Wire Wire Line
	6850 3450 6950 3450
Wire Wire Line
	4000 1650 4000 1550
Wire Wire Line
	6850 1550 6850 1900
Wire Wire Line
	8250 1950 7550 1950
$Comp
L Device:R_Small R1
U 1 1 603D91BA
P 4450 1800
F 0 "R1" H 4509 1846 50  0000 L CNN
F 1 "10k" H 4509 1755 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" H 4450 1800 50  0001 C CNN
F 3 "~" H 4450 1800 50  0001 C CNN
	1    4450 1800
	1    0    0    -1  
$EndComp
$Comp
L Switch:SW_Push SW1
U 1 1 603D8DFF
P 4450 3150
F 0 "SW1" H 4450 3435 50  0000 C CNN
F 1 "SW_Push" H 4450 3344 50  0000 C CNN
F 2 "Connector_PinSocket_2.54mm:PinSocket_1x02_P2.54mm_Vertical" H 4450 3350 50  0001 C CNN
F 3 "~" H 4450 3350 50  0001 C CNN
	1    4450 3150
	0    1    1    0   
$EndComp
Connection ~ 4650 3450
$Comp
L Transistor_FET:IRLZ44N Q1
U 1 1 603F131C
P 5200 3050
F 0 "Q1" H 5404 3096 50  0000 L CNN
F 1 "IRLZ44N" H 5404 3005 50  0000 L CNN
F 2 "Package_TO_SOT_THT:TO-220-3_Vertical" H 5450 2975 50  0001 L CIN
F 3 "http://www.irf.com/product-info/datasheets/data/irlz44n.pdf" H 5200 3050 50  0001 L CNN
	1    5200 3050
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_01x02 J1
U 1 1 603FD91E
P 5600 1750
F 0 "J1" H 5680 1742 50  0000 L CNN
F 1 "Conn_01x02" H 5680 1651 50  0000 L CNN
F 2 "Connector_PinSocket_2.54mm:PinSocket_1x02_P2.54mm_Vertical" H 5600 1750 50  0001 C CNN
F 3 "~" H 5600 1750 50  0001 C CNN
	1    5600 1750
	1    0    0    -1  
$EndComp
Wire Wire Line
	5400 1750 5300 1750
$Comp
L power:GND #PWR0101
U 1 1 60427ED9
P 4650 3550
F 0 "#PWR0101" H 4650 3300 50  0001 C CNN
F 1 "GND" H 4655 3377 50  0000 C CNN
F 2 "" H 4650 3550 50  0001 C CNN
F 3 "" H 4650 3550 50  0001 C CNN
	1    4650 3550
	1    0    0    -1  
$EndComp
$Comp
L power:+3V3 #PWR0102
U 1 1 60428B40
P 4000 1450
F 0 "#PWR0102" H 4000 1300 50  0001 C CNN
F 1 "+3V3" H 4015 1623 50  0000 C CNN
F 2 "" H 4000 1450 50  0001 C CNN
F 3 "" H 4000 1450 50  0001 C CNN
	1    4000 1450
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR0103
U 1 1 6042979B
P 3800 1450
F 0 "#PWR0103" H 3800 1300 50  0001 C CNN
F 1 "+5V" H 3815 1623 50  0000 C CNN
F 2 "" H 3800 1450 50  0001 C CNN
F 3 "" H 3800 1450 50  0001 C CNN
	1    3800 1450
	1    0    0    -1  
$EndComp
$Comp
L power:+12V #PWR0104
U 1 1 6042A2FD
P 1950 1450
F 0 "#PWR0104" H 1950 1300 50  0001 C CNN
F 1 "+12V" H 1965 1623 50  0000 C CNN
F 2 "" H 1950 1450 50  0001 C CNN
F 3 "" H 1950 1450 50  0001 C CNN
	1    1950 1450
	1    0    0    -1  
$EndComp
$Comp
L power:+12V #PWR0105
U 1 1 6042D854
P 6950 1450
F 0 "#PWR0105" H 6950 1300 50  0001 C CNN
F 1 "+12V" H 6965 1623 50  0000 C CNN
F 2 "" H 6950 1450 50  0001 C CNN
F 3 "" H 6950 1450 50  0001 C CNN
	1    6950 1450
	1    0    0    -1  
$EndComp
Wire Wire Line
	6950 1450 6950 1900
Wire Wire Line
	4000 1450 4000 1550
Connection ~ 4000 1550
Wire Wire Line
	3800 1450 3800 1550
Wire Wire Line
	3800 1550 2800 1550
Connection ~ 3800 1550
Wire Wire Line
	3800 1550 3800 1650
Wire Wire Line
	2850 3450 3900 3450
Connection ~ 3900 3450
Wire Wire Line
	4650 3550 4650 3450
$Comp
L power:+5V #PWR0106
U 1 1 6044B34C
P 5300 1450
F 0 "#PWR0106" H 5300 1300 50  0001 C CNN
F 1 "+5V" H 5315 1623 50  0000 C CNN
F 2 "" H 5300 1450 50  0001 C CNN
F 3 "" H 5300 1450 50  0001 C CNN
	1    5300 1450
	1    0    0    -1  
$EndComp
Wire Wire Line
	5300 1450 5300 1750
$Comp
L gravel:figge_LOGO G1
U 1 1 6046E0B7
P 10250 4050
F 0 "G1" H 10250 3246 60  0001 C CNN
F 1 "figge_LOGO" H 10250 4854 60  0001 C CNN
F 2 "gravel:figge_logo_15x15,9" H 10250 4050 50  0001 C CNN
F 3 "" H 10250 4050 50  0001 C CNN
	1    10250 4050
	1    0    0    -1  
$EndComp
Wire Wire Line
	2850 1750 2850 3450
Wire Wire Line
	2850 1750 2800 1750
Wire Wire Line
	2050 1750 1950 1750
Wire Wire Line
	4650 3450 4850 3450
Wire Wire Line
	4300 2050 6450 2050
$Comp
L Motor:Stepper_Motor_bipolar M1
U 1 1 603BE9C3
P 8150 2450
F 0 "M1" H 8338 2574 50  0000 L CNN
F 1 "Stepper_Motor_bipolar" H 8338 2483 50  0000 L CNN
F 2 "Connector_PinSocket_2.54mm:PinSocket_1x04_P2.54mm_Vertical" H 8160 2440 50  0001 C CNN
F 3 "http://www.infineon.com/dgdl/Application-Note-TLE8110EE_driving_UniPolarStepperMotor_V1.1.pdf?fileId=db3a30431be39b97011be5d0aa0a00b0" H 8160 2440 50  0001 C CNN
	1    8150 2450
	1    0    0    -1  
$EndComp
Wire Wire Line
	8250 2150 8250 1950
Wire Wire Line
	8050 2150 8050 2050
Wire Wire Line
	8050 2050 7650 2050
Wire Wire Line
	7650 2050 7650 2250
Wire Wire Line
	7350 2550 7850 2550
Wire Wire Line
	7850 2350 7750 2350
Wire Wire Line
	7750 2350 7750 2450
Wire Wire Line
	7750 2450 7350 2450
Wire Wire Line
	4000 1550 4450 1550
Wire Wire Line
	4450 1700 4450 1550
Connection ~ 4450 1550
Wire Wire Line
	4450 1550 6850 1550
Wire Wire Line
	4450 1900 4450 2550
Wire Wire Line
	4450 2550 4300 2550
Wire Wire Line
	4300 2650 6450 2650
Wire Wire Line
	6450 2750 4300 2750
Wire Wire Line
	4450 2550 4450 2950
Connection ~ 4450 2550
Wire Wire Line
	4450 3350 4450 3450
Connection ~ 4450 3450
Wire Wire Line
	4450 3450 4650 3450
$Comp
L Device:R_Small R2
U 1 1 604AAAE2
P 4850 3250
F 0 "R2" H 4909 3296 50  0000 L CNN
F 1 "10k" H 4909 3205 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" H 4850 3250 50  0001 C CNN
F 3 "~" H 4850 3250 50  0001 C CNN
	1    4850 3250
	1    0    0    -1  
$EndComp
Wire Wire Line
	4850 3350 4850 3450
Connection ~ 4850 3450
Wire Wire Line
	4850 3450 5300 3450
Wire Wire Line
	4850 3150 4850 3050
Wire Wire Line
	4850 3050 5000 3050
Wire Wire Line
	4850 3050 4850 2850
Wire Wire Line
	4850 2850 4300 2850
Connection ~ 4850 3050
Wire Wire Line
	5300 1850 5400 1850
Wire Wire Line
	5300 3250 5300 3450
Connection ~ 5300 3450
Wire Wire Line
	5300 3450 6850 3450
Wire Wire Line
	5300 1850 5300 2850
$Comp
L gravel:fritte_LOGO G2
U 1 1 603D8172
P 10400 5700
F 0 "G2" H 10400 4930 60  0001 C CNN
F 1 "fritte_LOGO" H 10400 6470 60  0001 C CNN
F 2 "gravel:fritte_LOGO_5x5" H 10400 5700 50  0001 C CNN
F 3 "" H 10400 5700 50  0001 C CNN
	1    10400 5700
	1    0    0    -1  
$EndComp
$Comp
L gravel:TMC2208_V3_Breakout U3
U 1 1 603DE937
P 6450 2750
F 0 "U3" H 6900 3765 50  0000 C CNN
F 1 "TMC2208_V3_Breakout" H 6900 3682 39  0000 C CNN
F 2 "gravel:TMC2208_V3_Breakout" H 7200 2650 50  0001 C CNN
F 3 "https://github.com/bigtreetech/BIGTREETECH-TMC2208-V3.0" H 7200 2650 50  0001 C CNN
	1    6450 2750
	1    0    0    -1  
$EndComp
$Comp
L gravel:LM2596_DC-DC_ADJ U1
U 1 1 603DFC06
P 2050 1750
F 0 "U1" H 2425 2165 50  0000 C CNN
F 1 "LM2596_DC-DC_ADJ" H 2425 2074 50  0000 C CNN
F 2 "gravel:LM2596_DC-DC" H 2350 1600 50  0001 C CNN
F 3 "" H 2350 1600 50  0001 C CNN
	1    2050 1750
	1    0    0    -1  
$EndComp
$Comp
L Connector:Screw_Terminal_01x02 J2
U 1 1 603FDAF0
P 1200 1600
F 0 "J2" H 1118 1817 50  0000 C CNN
F 1 "Screw_Terminal_01x02" H 1118 1726 50  0000 C CNN
F 2 "TerminalBlock:TerminalBlock_bornier-2_P5.08mm" H 1200 1600 50  0001 C CNN
F 3 "~" H 1200 1600 50  0001 C CNN
	1    1200 1600
	-1   0    0    -1  
$EndComp
Wire Wire Line
	1400 1600 1800 1600
Wire Wire Line
	1400 1700 1800 1700
Wire Wire Line
	1800 1700 1850 1750
$Comp
L Mechanical:MountingHole H1
U 1 1 6041C6AF
P 6200 6800
F 0 "H1" H 6300 6846 50  0000 L CNN
F 1 "MountingHole" H 6300 6755 50  0000 L CNN
F 2 "MountingHole:MountingHole_3.2mm_M3" H 6200 6800 50  0001 C CNN
F 3 "~" H 6200 6800 50  0001 C CNN
	1    6200 6800
	1    0    0    -1  
$EndComp
$Comp
L Mechanical:MountingHole H2
U 1 1 6041DA61
P 6200 7000
F 0 "H2" H 6300 7046 50  0000 L CNN
F 1 "MountingHole" H 6300 6955 50  0000 L CNN
F 2 "MountingHole:MountingHole_3.2mm_M3" H 6200 7000 50  0001 C CNN
F 3 "~" H 6200 7000 50  0001 C CNN
	1    6200 7000
	1    0    0    -1  
$EndComp
$Comp
L Mechanical:MountingHole H3
U 1 1 6041E7BC
P 6200 7200
F 0 "H3" H 6300 7246 50  0000 L CNN
F 1 "MountingHole" H 6300 7155 50  0000 L CNN
F 2 "MountingHole:MountingHole_3.2mm_M3" H 6200 7200 50  0001 C CNN
F 3 "~" H 6200 7200 50  0001 C CNN
	1    6200 7200
	1    0    0    -1  
$EndComp
$Comp
L Mechanical:MountingHole H4
U 1 1 6041F364
P 6200 7400
F 0 "H4" H 6300 7446 50  0000 L CNN
F 1 "MountingHole" H 6300 7355 50  0000 L CNN
F 2 "MountingHole:MountingHole_3.2mm_M3" H 6200 7400 50  0001 C CNN
F 3 "~" H 6200 7400 50  0001 C CNN
	1    6200 7400
	1    0    0    -1  
$EndComp
Wire Wire Line
	7650 2250 7350 2250
Wire Wire Line
	7550 1950 7550 2350
Wire Wire Line
	7550 2350 7350 2350
Wire Wire Line
	1800 1600 1850 1550
Wire Wire Line
	1850 1550 1950 1550
Wire Wire Line
	1950 1450 1950 1550
Connection ~ 1950 1550
Wire Wire Line
	1950 1550 2050 1550
Wire Wire Line
	1950 1750 1950 3450
Wire Wire Line
	1950 3450 2850 3450
Connection ~ 1950 1750
Wire Wire Line
	1950 1750 1850 1750
Connection ~ 2850 3450
$EndSCHEMATC
