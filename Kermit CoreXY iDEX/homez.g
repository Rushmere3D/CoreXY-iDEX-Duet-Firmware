; homez.g
; called to home the Z axis
;
; generated by RepRapFirmware Configuration Tool v3.1.4 on Fri Oct 30 2020 10:16:50 GMT+0000 (Greenwich Mean Time)
G91
G1 H2 Z5 F1200        ; raise head 5mm to keep it clear of the bed
G90
G1 X-43 Y0 F4000      ; move to bed centre for probing
G30                   ; probe the bed and set Z height