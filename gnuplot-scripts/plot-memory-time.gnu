set terminal pngcairo
set output 'memory-time.png'

set logscale x
set logscale y
set xlabel 'Runtime (s)'
set ylabel 'Memory Data Volume (GByte)'
set xrange[0:600]
set yrange[0:15000]
set ytics font "Times-New-Roman,10"
set xtics font "Times-New-Roman,10"
set xlabel font "Times-New-Roman,10"
set ylabel font "Times-New-Roman,10"

set key at screen 0.94, 0.61 
set key font "Times-New-Roman,8"
set key box

bandwidth = 117.52940          
max_band_label = "stream\\_mem\\_avx\\_fma"
max_band_label_offset = 50
set label at 0.13,10000 sprintf("Maximum Bandwidth: %.2f GByte/s", bandwidth) font "Times-New-Roman,10"
set label at 0.13,7000 sprintf("(%s)",max_band_label) font "Times-New-Roman,10"
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
    (bandwidth * x) with lines lw 2 lc rgb 'black' dt 2 notitle


0.288239 20.8987
e
3.288259 320.4472
e
32.648791 3372.7625
e


1.211071 59.7356
e
12.324421 654.2955
e
120.863211 6628.5587
e


5.271214 116.6907
e
50.318205 1233.8524
e
507.853304 12379.2739
e


0.133578 5.0769
e
1.648959 107.4308
e
16.057203 1147.196
e


0.604925 16.5052
e
6.323508 293.5988
e
60.993803 3122.644
e


2.670551 51.2331
e
27.105419 571.4033
e
274.978457 5745.9234
e
