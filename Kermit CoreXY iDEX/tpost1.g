; tpost1.g
; called after tool 1 has been selected
;
; generated by RepRapFirmware Configuration Tool v3.1.4 on Fri Oct 30 2020 10:16:50 GMT+0000 (Greenwich Mean Time)
M106 R2           ; restore print cooling fan speed
M116 P1 	      ; wait for tool 0 heaters to reach operating temperature
M83               ; relative extruder movement
G1 E5 F3600 	  ; extrude 5mm