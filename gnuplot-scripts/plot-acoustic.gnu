set terminal pngcairo
set output 'roofline-seissol-proxy-acoustic.png'

set xlabel 'Double Precision Operational Intensity (FLOP/Byte)'
set ylabel 'Double Precision Performance (GFLOP/s)'
set xrange[0:27]
set yrange[0:1325]
set ytics font "Times-New-Roman,10"
set xtics font "Times-New-Roman,10"
set xlabel font "Times-New-Roman,10"
set ylabel font "Times-New-Roman,10"


set key at screen 0.94, 0.83 
set key font "Times-New-Roman,10"
set key box


peak_flops = 1150.82684       
bandwidth = 117.52940          
max_perf_label = "peakflops\\_avx\\_fma"
max_perf_label_offset = 115
max_band_label = "stream\\_mem\\_avx\\_fma"
max_band_label_offset = 50
set label at 0.75,peak_flops+max_perf_label_offset sprintf("Peak Performance: %.2f GFLOP/s (%s)", peak_flops, max_perf_label) font "Times-New-Roman,10"
set label at 0.75,peak_flops+max_band_label_offset sprintf("Maximum Bandwidth: %.2f GByte/s (%s)", bandwidth, max_band_label) font "Times-New-Roman,10"

plot \
    '-' using 1:2 with points pointtype 4 pointsize 1.5 linecolor rgb 'red' title 'order=4, cells=0.01M', \
    '-' using 1:2 with points pointtype 4 pointsize 1.5 linecolor rgb 'green' title 'order=4, cells=0.10M', \
    '-' using 1:2 with points pointtype 4 pointsize 1.5 linecolor rgb 'blue' title 'order=4, cells=1.00M', \
    '-' using 1:2 with points pointtype 6 pointsize 1.5 linecolor rgb 'red' title 'order=6, cells=0.01M', \
    '-' using 1:2 with points pointtype 6 pointsize 1.5 linecolor rgb 'green' title 'order=6, cells=0.10M', \
    '-' using 1:2 with points pointtype 6 pointsize 1.5 linecolor rgb 'blue' title 'order=6, cells=1.00M', \
    '-' using 1:2 with points pointtype 8 pointsize 1.5 linecolor rgb 'red' title 'order=8, cells=0.01M', \
    '-' using 1:2 with points pointtype 8 pointsize 1.5 linecolor rgb 'green' title 'order=8, cells=0.10M', \
    '-' using 1:2 with points pointtype 8 pointsize 1.5 linecolor rgb 'blue' title 'order=8, cells=1.00M', \
    (x < peak_flops / bandwidth ? bandwidth * x : peak_flops) with lines lw 2 lc rgb 'black' notitle


9.49924559048041 361.037895
e
4.49109686018745 292.598014
e
4.20570895987965 300.47403
e


17.6650607007261 481.985965
e
9.93113469451547 461.099951
e
9.33730077585295 478.033256
e


25.2427434478824 484.268602
e
22.6331209477951 477.123781
e
22.5075050706796 470.314662
e
