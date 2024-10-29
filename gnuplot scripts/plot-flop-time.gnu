set terminal pngcairo
set output 'flop-time.png'

set logscale x
set logscale y
set xlabel 'Runtime (s)'
set ylabel 'Double Precision Floating-Point Operations (G)'
set xrange[0:600]
set yrange[0:500000]
set ytics font "Times-New-Roman,10"
set xtics font "Times-New-Roman,10"
set xlabel font "Times-New-Roman,10"
set ylabel font "Times-New-Roman,10"

set key at screen 0.94, 0.61 
set key font "Times-New-Roman,8"
set key box

peak_flops = 1150.82684      
max_perf_label = "peakflops\\_avx\\_fma"
set label at 0.13,290000 sprintf("Peak Performance: %.2f GFLOP/s", peak_flops) font "Times-New-Roman,10"
set label at 0.13,190000 sprintf("(%s)",max_perf_label) font "Times-New-Roman,10"

plot \
    '-' using 1:2 with points pointtype 4 pointsize 1.5 linecolor rgb 'red' title 'order=4, cells=0.01M, elastic', \
    '-' using 1:2 with points pointtype 4 pointsize 1.5 linecolor rgb 'green' title 'order=4, cells=0.10M, elastic', \
    '-' using 1:2 with points pointtype 4 pointsize 1.5 linecolor rgb 'blue' title 'order=4, cells=1.00M, elastic', \
    '-' using 1:2 with points pointtype 6 pointsize 1.5 linecolor rgb 'red' title 'order=6, cells=0.01M, elastic', \
    '-' using 1:2 with points pointtype 6 pointsize 1.5 linecolor rgb 'green' title 'order=6, cells=0.10M, elastic', \
    '-' using 1:2 with points pointtype 6 pointsize 1.5 linecolor rgb 'blue' title 'order=6, cells=1.00M, elastic', \
    '-' using 1:2 with points pointtype 8 pointsize 1.5 linecolor rgb 'red' title 'order=8, cells=0.01M, elastic', \
    '-' using 1:2 with points pointtype 8 pointsize 1.5 linecolor rgb 'green' title 'order=8, cells=0.10M, elastic', \
    '-' using 1:2 with points pointtype 8 pointsize 1.5 linecolor rgb 'blue' title 'order=8, cells=1.00M, elastic', \
    '-' using 1:2 with points pointtype 5 pointsize 1.5 linecolor rgb 'red' title 'order=4, cells=0.01M, acoustic', \
    '-' using 1:2 with points pointtype 5 pointsize 1.5 linecolor rgb 'green' title 'order=4, cells=0.10M, acoustic', \
    '-' using 1:2 with points pointtype 5 pointsize 1.5 linecolor rgb 'blue' title 'order=4, cells=1.00M, acoustic', \
    '-' using 1:2 with points pointtype 7 pointsize 1.5 linecolor rgb 'red' title 'order=6, cells=0.01M, acoustic', \
    '-' using 1:2 with points pointtype 7 pointsize 1.5 linecolor rgb 'green' title 'order=6, cells=0.10M, acoustic', \
    '-' using 1:2 with points pointtype 7 pointsize 1.5 linecolor rgb 'blue' title 'order=6, cells=1.00M, acoustic', \
    '-' using 1:2 with points pointtype 9 pointsize 1.5 linecolor rgb 'red' title 'order=8, cells=0.01M, acoustic', \
    '-' using 1:2 with points pointtype 9 pointsize 1.5 linecolor rgb 'green' title 'order=8, cells=0.10M, acoustic', \
    '-' using 1:2 with points pointtype 9 pointsize 1.5 linecolor rgb 'blue' title 'order=8, cells=1.00M, acoustic', \
    (peak_flops * x) with lines lw 2 lc rgb 'black' dt 2 notitle

0.288239 125.79012
e
3.288259 1258.384787
e
32.648791 12583.73811
e

1.211071 703.1818803
e
12.324421 7032.086855
e
120.863211 70319.41718
e

5.271214 3016.763999
e
50.318205 30167.64001
e
507.853304 301676.4
e

0.133578 48.22671994
e
1.648959 482.4821286
e
16.057203 4824.772496
e

0.604925 291.5653599
e
6.323508 2915.769229
e
60.993803 29157.06624
e

2.670551 1293.263999
e
27.105419 12932.64
e
274.978457 129326.4001
e
