set terminal pngcairo
set output 'roofline-theoretical-vs-benchmark.png'

set xlabel 'Double Precision Operational Intensity (FLOP/Byte)'
set ylabel 'Double Precision Performance (GFLOP/s)'
set xrange[0:27]
set yrange[0:1475]
set ytics font "Times-New-Roman,10"
set xtics font "Times-New-Roman,10"
set xlabel font "Times-New-Roman,10"
set ylabel font "Times-New-Roman,10"

set key at screen 0.93, 0.745 
set key font "Times-New-Roman,10"
set key box

peak_flops = 1150.82684       
bandwidth = 117.52940          
th_peak_flops = 1164.8
th_bandwidth = 136

max_perf_label_offset = 115
max_band_label_offset = 50
th_max_perf_label_offset = 245
th_max_band_label_offset = 180
set label at 0.75,th_peak_flops+max_perf_label_offset sprintf("Peak Performance (Benchmark): %.2f GFLOP/s", peak_flops) font "Times-New-Roman,10"
set label at 0.75,th_peak_flops+max_band_label_offset sprintf("Maximum Bandwidth (Benchmark): %.2f GByte/s", bandwidth) font "Times-New-Roman,10"
set label at 0.75,th_peak_flops+th_max_perf_label_offset sprintf("Peak Performance (Theoretical): %.2f GFLOP/s", th_peak_flops) font "Times-New-Roman,10"
set label at 0.75,th_peak_flops+th_max_band_label_offset sprintf("Maximum Bandwidth (Theoretical): %.2f GByte/s", th_bandwidth) font "Times-New-Roman,10"

plot \
    (x < th_peak_flops / th_bandwidth ? th_bandwidth * x : th_peak_flops) with lines lw 2 lc rgb 'black' dt 2 title 'Theoretical', \
    (x < peak_flops / bandwidth ? bandwidth * x : peak_flops) with lines lw 2 lc rgb 'black' title 'Benchmark'