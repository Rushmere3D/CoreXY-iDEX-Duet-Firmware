; Configuration file for Duet 3 (firmware version 3)
; executed by the firmware on start-up
;
; generated by RepRapFirmware Configuration Tool v3.1.4 on Fri Oct 30 2020 10:16:50 GMT+0000 (Greenwich Mean Time)

; General preferences
G90                                                   ; send absolute coordinates...
M83                                                   ; ...but relative extruder moves
M550 P"duet3"                                         ; set printer name
M564 S1 H0											  ; allow movement of axes that have not been homed but within limits

G4 S3

; Drives
M569 P0.0 S1                                          	; physical drive 0.0 (X) goes forwards (change to S0 to reverse it)
M569 P0.1 S1                                          	; physical drive 0.1 (Y) goes forwards
M569 P0.2 S0                                          	; physical drive 0.2 (U) goes backwards
M569 P0.3 S1										  	; physical drive 0.3 (Z) goes forwards
M569 P0.4 S1										  	; physical drive 0.4 (Z1) goes fordwards
M569 P1.0 S0                                          	; physical drive 1.0 (E0) goes backwards
M569 P1.1 S1                                          	; physical drive 1.1 (E1) goes forwards
M584 X0.0 Y0.1 Z0.3:0.4 U0.2 E1.0:1.1                 	; set drive mapping
M669 X1:1:0:0 Y1:-1:0:-1 Z0:0:1:0 U0:0:0:1         	 	; select CoreXY mode with movement coefficient
M671 X0:0 Y-120:120 S0.6								; X and Y coordinates of the leadscrews
M350 X16 Y16 U16 Z16 E16:16 I1                          ; configure microstepping with interpolation
M92 X80.00 Y80.00 U80.00 Z400.00 E133.00:133.00  		; set steps per mm
M566 X300.00 Y300.00 U300.00 Z60.00 E420.00           	; set maximum instantaneous speed changes (mm/min)
M203 X18000.00 Y18000.00 U18000.00 Z360.00 E1500.00   	; set maximum speeds (mm/min)
M201 X3000.00 Y3000.00 U3000.00 Z300.00 E10000.00     	; set accelerations (mm/s^2)
M906 X800 Y800 U800 Z900 E900 I50                     	; set motor currents (mA) and motor idle factor in per cent
M84 S30                                               	; Set idle timeout

; Axis Limits
M208 X-177 Y-135 U-83 Z0 S1                            ; set axis minima
M208 X86 Y135 U180 Z300 S0                             ; set axis maxima

; Endstops
M574 X1 S1 P"!io3.in"                                   ; configure active-low endstop for low end on X via pin io3.in
M574 Y2 S1 P"!io5.in"                                   ; configure active-low endstop for high end on Y via pin io5.in
M574 U2 S1 P"!io4.in"                                   ; configure active-low endstop for High end on U via pin io4.in
M574 Z1 S2                                              ; configure Z-probe endstop for low end on Z

; Z-Probe
M558 P5 C"io6.in" H5 F300 T6000                         ; set Z probe type to switch (PINDA V1) and the dive height + speeds
G31 P500 X43 Y5 Z0.47                                   ; set Z probe trigger value, offset and trigger height
M557 X-134:123 Y-120:130 P5                             ; define mesh grid

; Heaters
M308 S0 P"temp0" Y"thermistor" A"Keenovo Bed" T100000 B3950           ; configure sensor 0 as thermistor on pin temp0
M950 H0 C"out0" T0                                		      		  ; create bed heater output on out0 and map it to sensor 0
M307 H0 B0 S1.00                                        	  		  ; disable bang-bang mode for the bed heater and set PWM limit
M140 H0                                                 	 		  ; map heated bed to heater 0
M143 H0 S120                                            			  ; set temperature limit for heater 0 to 120C
M308 S1 P"temp1" Y"thermistor" A"E0 E3D v6" T100000 B4725 C7.06e-8    ; configure sensor 1 as thermistor on pin temp1
M950 H1 C"out1" T1                                      			  ; create nozzle heater output on out1 and map it to sensor 1
M307 H1 B0 S1.00                                         		      ; disable bang-bang mode for heater  and set PWM limit
M143 H1 S280                                              		      ; set temperature limit for heater 1 to 280C
M308 S2 P"temp2" Y"thermistor" A"E1 E3D v6" T100000 B4725 C7.06e-8    ; configure sensor 2 as thermistor on pin temp2
M950 H2 C"out2" T2                                           		  ; create nozzle heater output on out2 and map it to sensor 2
M307 H2 B0 S1.00                                                      ; disable bang-bang mode for heater  and set PWM limit
M143 H2 S280                                             		      ; set temperature limit for heater 2 to 280C

; Heater model parameters
M307 H0 A288.7 C392.8 D1.6 S1.0 V24.0 B0
M307 H1 A490.7 C237.4 D4.7 S1.0 V24.0 B0
M307 H2 A490.7 C237.4 D4.7 S1.0 V24.0 B0

; Fans
M950 F0 C"out4" Q500                                    ; create fan 0 on pin out4 and set its frequency
M106 P0 S0 H-1                                          ; set fan 0 value. Thermostatic control is turned off
M950 F1 C"out7" Q500                                    ; create fan 1 on pin out7 and set its frequency
M106 P1 S1 H1 T50                                       ; set fan 1 value. Thermostatic control is turned on
M950 F2 C"out5" Q500                                    ; create fan 2 on pin out5 and set its frequency
M106 P2 S0 H-1                                          ; set fan 2 value. Thermostatic control is turned off
M950 F3 C"out8" Q500                                    ; create fan 3 on pin out8 and set its frequency
M106 P3 S1 H2 T50                                       ; set fan 3 value. Thermostatic control is turned on

; Tools

;Create a tool that uses the low end (X) carriage
M563 P0 S"Main Extruder" D0 H1 F0                     ; define tool 0
G10 P0 X0 Y0 Z0                                       ; set tool 0 axis offsets
G10 P0 R195 S0                                        ; set initial tool 0 active and standby temperatures to 0C

;Create a tool that uses the high end (U) carriage
M563 P1 S"Support Extruder" D1 H2 X3 F2               ; define tool 1
G10 P1 X0 Y-0.2 U1.0 Z0                               ; set tool 1 axis offsets
G10 P1 R0 S0                                          ; set initial tool 1 active and standby temperatures to 0C

;Create a tool that uses the high end (U) carriage
M563 P2 S"Secondary Extruder" D1 H2 X3 F2             ; define tool 2
G10 P2 X0 Y-0.2 U1.0 Z0                               ; set tool 2 axis offsets
G10 P2 R0 S0                                          ; set initial tool 2 active and standby temperatures to 0C

;Create a tool that prints 2 copies of the object using both carriages
M563 P3 S"Ditto Printing" D0:1 H1:2 X0:3 F0:2         ; define tool 3
G10 P3 X77.5 Y0 U-77.5 Z0                             ; set tool 3 axis offsets
G10 P3 R0 S0                                          ; set initial tool 3 active and standby temperatures to 0C
M567 P3 E1:1 ; set mix ratio 100% on both extruders
;M568 P3 S1 ; turn on mixing for tool 2

; Custom settings are not defined
T0
