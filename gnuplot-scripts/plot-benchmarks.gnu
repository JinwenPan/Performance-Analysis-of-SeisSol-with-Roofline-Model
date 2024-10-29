set terminal pngcairo
set output 'roofline-benchmarks.png'

set xlabel 'Double (Single) Precision Operational Intensity (FLOP/Byte)'
set ylabel 'Double (Single) Precision Performance (GFLOP/s)'
set xrange[0:40]
set yrange[0:1200]
set ytics font "Times-New-Roman,10"
set xtics font "Times-New-Roman,10"
set xlabel font "Times-New-Roman,10"
set ylabel font "Times-New-Roman,10"


set key at screen 0.93, 0.9 
set key font "Times-New-Roman,8"
set key box

peakflops_normal = 150.470592 
peakflops_sp = 145.50726 
peakflops_avx = 583.033032 
peak_flops = 1150.82684

load_band = 126.571566
copy_band = 73.633681
stream_band = 81.529481
stream_avx_fma_band = 76.498598
bandwidth = 117.52940         
stream_sp_band = 81.44014826

# max_perf_label_offset = 115
# max_band_label_offset = 50
# th_max_perf_label_offset = 245
# th_max_band_label_offset = 180
# set label at 0.75,th_peak_flops+max_perf_label_offset sprintf("Peak Performance (Benchmark): %.2f GFLOP/s", peak_flops) font "Times-New-Roman,10"
# set label at 0.75,th_peak_flops+max_band_label_offset sprintf("Maximum Bandwidth (Benchmark): %.2f GByte/s", bandwidth) font "Times-New-Roman,10"
# set label at 0.75,th_peak_flops+th_max_perf_label_offset sprintf("Peak Performance (Theoretical): %.2f GFLOP/s", th_peak_flops) font "Times-New-Roman,10"
# set label at 0.75,th_peak_flops+th_max_band_label_offset sprintf("Maximum Bandwidth (Theoretical): %.2f GByte/s", th_bandwidth) font "Times-New-Roman,10"

set samples 1000
plot \
    (x >= peak_flops / load_band ? peak_flops : 1/0) with lines lw 2 lc rgb 'black' dt 2 title 'peakflops\_avx\_fma: 1150.83 GFLOP/s', \
    (x >= peakflops_avx / load_band ? peakflops_avx : 1/0) with lines lw 2 lc rgb 'red' dt 2 title 'peakflops\_avx: 583.03 GFLOP/s', \
    (x >= peakflops_normal / load_band ? peakflops_normal : 1/0) with lines lw 2 lc rgb 'green' dt 2 title 'peakflops: 150.47 GFLOP/s', \
    (x >= peakflops_sp / load_band ? peakflops_sp : 1/0) with lines lw 2 lc rgb 'blue' dt 3 title 'peakflops\_sp: 145.51 GFLOP/s',\
    (load_band * x <= peak_flops ? load_band * x : 1/0) with lines lw 2 lc rgb 'purple' title 'load: 126.57 GByte/s', \
    (bandwidth * x <= peak_flops ? bandwidth * x : 1/0) with lines lw 2 lc rgb 'black' title 'stream\_mem\_avx\_fma: 117.53 GByte/s', \
    (stream_band * x <= peak_flops ? stream_band * x : 1/0) with lines lw 2 lc rgb 'red' title 'stream: 81.53 GByte/s', \
    (stream_sp_band * x <= peak_flops ? stream_sp_band * x : 1/0) with lines lw 2 lc rgb 'green' dt 3 title 'stream\_sp: 81.44 GByte/s', \
    (stream_avx_fma_band * x <= peak_flops ? stream_avx_fma_band * x : 1/0) with lines lw 2 lc rgb 'blue' title 'stream\_avx\_fma: 76.50 GByte/s', \
    (copy_band * x <= peak_flops ? copy_band * x : 1/0) with lines lw 2 lc rgb 'orange' title 'copy: 73.63 GByte/s'
