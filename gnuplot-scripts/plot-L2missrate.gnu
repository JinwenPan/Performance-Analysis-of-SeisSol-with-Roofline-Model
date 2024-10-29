set terminal pngcairo
set output 'l2_cache_miss_rate.png'

set ylabel 'L2 Cache Miss Rate (%)'
set boxwidth 0.3  
set style fill solid 0.5  
set xtics rotate by -45  
set ytics font "Times-New-Roman,10"
set xtics font "Times-New-Roman,10"
set xlabel font "Times-New-Roman,10"
set ylabel font "Times-New-Roman,10"

set key font "Times-New-Roman,10"
set key box

set xtics ("order=4, cells=0.01M" 1, "order=4, cells=0.10M" 2, "order=4, cells=1.00M" 3, \
           "order=6, cells=0.01M" 4, "order=6, cells=0.10M" 5, "order=6, cells=1.00M" 6, \
           "order=8, cells=0.01M" 7, "order=8, cells=0.10M" 8, "order=8, cells=1.00M" 9)

plot \
    '-' using ($1-0.15):2 with boxes linecolor rgb 'blue' title 'elastic', \
    '' using ($1+0.15):2 with boxes linecolor rgb 'red' title 'acoustic'

# Order 4
1 20.47 0.3  # Elastic 0.2, Acoustic 0.3
2 21.85 0.35  # Elastic 0.25, Acoustic 0.35
3 21.77 0.25  # Elastic 0.15, Acoustic 0.25
# Order 6
4 9.78 0.4  # Elastic 0.3, Acoustic 0.4
5 11.77 0.45  # Elastic 0.35, Acoustic 0.45
6 9.69 0.35  # Elastic 0.25, Acoustic 0.35
# Order 8
7 13.36 0.5  # Elastic 0.4, Acoustic 0.5
8 13.64 0.55  # Elastic 0.45, Acoustic 0.55
9 13.92 0.45  # Elastic 0.35, Acoustic 0.45
e
# Order 4
1 18.88 0.3  # Elastic 0.2, Acoustic 0.3
2 18.94 0.35  # Elastic 0.25, Acoustic 0.35
3 18.57 0.25  # Elastic 0.15, Acoustic 0.25
# Order 6
4 11.47 0.4  # Elastic 0.3, Acoustic 0.4
5 5.67 0.45  # Elastic 0.35, Acoustic 0.45
6 11.43 0.35  # Elastic 0.25, Acoustic 0.35
# Order 8
7 17.72 0.5  # Elastic 0.4, Acoustic 0.5
8 17.86 0.55  # Elastic 0.45, Acoustic 0.55
9 17.92 0.45  # Elastic 0.35, Acoustic 0.45
e
