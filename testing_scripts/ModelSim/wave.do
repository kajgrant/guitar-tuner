onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /hps/clk
add wave -noupdate /hps/counter
add wave -noupdate -radix decimal /hps/d1
add wave -noupdate -radix decimal /hps/d2
add wave -noupdate -radix decimal /hps/d3
add wave -noupdate -radix decimal /hps/d5
add wave -noupdate -radix decimal /hps/o
add wave -noupdate -radix decimal /hps/ovalid
add wave -noupdate -radix decimal /hps/temp1
add wave -noupdate -radix decimal /hps/temp2
add wave -noupdate -radix decimal /hps/data
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {1339 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 150
configure wave -valuecolwidth 100
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
WaveRestoreZoom {583 ps} {1832 ps}
view wave 
wave clipboard store
wave create -driver freeze -pattern counter -startvalue 0000000000000000 -endvalue 1111111111111111 -type Range -direction Up -period 100ps -step 1 -repeat forever -range 15 0 -starttime 0ns -endtime 1000ns sim:/hps/data 
WaveExpandAll -1
WaveCollapseAll -1
wave clipboard restore
