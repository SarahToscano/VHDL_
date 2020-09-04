onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /add4/Data1
add wave -noupdate /add4/Data2
add wave -noupdate /add4/Cin
add wave -noupdate /add4/Cout
add wave -noupdate /add4/Sum
add wave -noupdate /add4/Out5Bit
TreeUpdate [SetDefaultTree]
WaveRestoreCursors
quietly wave cursor active 0
configure wave -namecolwidth 119
configure wave -valuecolwidth 40
configure wave -justifyvalue left
configure wave -signalnamewidth 0
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ps
update
WaveRestoreZoom {0 ps} {1392 ps}
