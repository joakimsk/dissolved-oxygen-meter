EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title "Dissolved Oxygen interface"
Date "2021-04-15"
Rev "v0.1.0"
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L Amplifier_Operational:LM324 U1
U 1 1 60785674
P 5400 3600
F 0 "U1" H 5400 3967 50  0000 C CNN
F 1 "LM324" H 5400 3876 50  0000 C CNN
F 2 "Package_SO:SOIC-14W_7.5x9mm_P1.27mm" H 5350 3700 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/lm2902-n.pdf" H 5450 3800 50  0001 C CNN
	1    5400 3600
	1    0    0    -1  
$EndComp
$Comp
L Device:R Rf1
U 1 1 607873C3
P 6050 3900
F 0 "Rf1" H 6120 3946 50  0000 L CNN
F 1 "300k" H 6120 3855 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.20x1.40mm_HandSolder" V 5980 3900 50  0001 C CNN
F 3 "~" H 6050 3900 50  0001 C CNN
	1    6050 3900
	1    0    0    -1  
$EndComp
$Comp
L Device:R Rin1
U 1 1 6078A4D1
P 6050 4200
F 0 "Rin1" H 6120 4246 50  0000 L CNN
F 1 "10k" H 6120 4155 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.20x1.40mm_HandSolder" V 5980 4200 50  0001 C CNN
F 3 "~" H 6050 4200 50  0001 C CNN
	1    6050 4200
	1    0    0    -1  
$EndComp
Wire Wire Line
	6050 4050 5100 4050
Wire Wire Line
	5100 4050 5100 3700
Connection ~ 6050 4050
Wire Wire Line
	5700 3600 6050 3600
Wire Wire Line
	6050 3600 6050 3750
Wire Wire Line
	6050 3600 6600 3600
Connection ~ 6050 3600
$Comp
L power:GND #PWR02
U 1 1 6078C55F
P 6050 4350
F 0 "#PWR02" H 6050 4100 50  0001 C CNN
F 1 "GND" H 6055 4177 50  0000 C CNN
F 2 "" H 6050 4350 50  0001 C CNN
F 3 "" H 6050 4350 50  0001 C CNN
	1    6050 4350
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR01
U 1 1 6078CD93
P 4300 4350
F 0 "#PWR01" H 4300 4100 50  0001 C CNN
F 1 "GND" H 4305 4177 50  0000 C CNN
F 2 "" H 4300 4350 50  0001 C CNN
F 3 "" H 4300 4350 50  0001 C CNN
	1    4300 4350
	1    0    0    -1  
$EndComp
$Comp
L Device:Battery_Cell DOP1
U 1 1 6079116B
P 4300 3700
F 0 "DOP1" H 4418 3796 50  0000 L CNN
F 1 "DO Probe" H 4418 3705 50  0000 L CNN
F 2 "TerminalBlock_Phoenix:TerminalBlock_Phoenix_MKDS-1,5-2_1x02_P5.00mm_Horizontal" V 4300 3760 50  0001 C CNN
F 3 "~" V 4300 3760 50  0001 C CNN
	1    4300 3700
	1    0    0    -1  
$EndComp
Wire Wire Line
	4300 3800 4300 4350
Wire Wire Line
	4300 3500 5100 3500
Text Label 6600 3600 0    50   ~ 0
ToADC
$EndSCHEMATC
