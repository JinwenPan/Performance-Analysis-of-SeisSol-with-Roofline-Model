set terminal pngcairo
set output 'roofline-seissol-proxy-elastic.png'

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


6.019040418 436.409091
e
3.926964527 382.690289
e
3.730988502 385.427384
e


11.7715714 580.628122
e
10.74757026 570.581519
e
10.60855314 581.809937
e


25.85265148 572.309149
e
24.44995853 599.537285
e
24.36947453 594.022718
e
