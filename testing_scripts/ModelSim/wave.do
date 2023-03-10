view wave 
wave clipboard store
wave create -driver freeze -pattern clock -initialvalue U -period 100ps -dutycycle 50 -starttime 0ps -endtime 5000ps sim:/hps/clk 
wave create -driver freeze -pattern counter -startvalue 0000000000000000 -endvalue 1111111111111111 -type Range -direction Up -period 50ps -step 1 -repeat forever -range 15 0 -starttime 0ps -endtime 5000ps sim:/hps/data 
WaveExpandAll -1
WaveCollapseAll -1
wave clipboard restore
