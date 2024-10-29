set terminal pngcairo
set output 'l3_cache_miss_rate.png'

set ylabel 'L3 Cache Miss Rate (%)'
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
1 19.82 0.3  # Elastic 0.2, Acoustic 0.3
2 38.12 0.35  # Elastic 0.25, Acoustic 0.35
3 44.39 0.25  # Elastic 0.15, Acoustic 0.25
# Order 6
4 5.1 0.4  # Elastic 0.3, Acoustic 0.4
5 8.62 0.45  # Elastic 0.35, Acoustic 0.45
6 6.85 0.35  # Elastic 0.25, Acoustic 0.35
# Order 8
7 1.25 0.5  # Elastic 0.4, Acoustic 0.5
8 1.75 0.55  # Elastic 0.45, Acoustic 0.55
9 1.4 0.45  # Elastic 0.35, Acoustic 0.45
e
# Order 4
1 22.95 0.3  # Elastic 0.2, Acoustic 0.3
2 51.7 0.35  # Elastic 0.25, Acoustic 0.35
3 61.85 0.25  # Elastic 0.15, Acoustic 0.25
# Order 6
4 1.21 0.4  # Elastic 0.3, Acoustic 0.4
5 6.3 0.45  # Elastic 0.35, Acoustic 0.45
6 11.53 0.35  # Elastic 0.25, Acoustic 0.35
# Order 8
7 0.45 0.5  # Elastic 0.4, Acoustic 0.5
8 0.66 0.55  # Elastic 0.45, Acoustic 0.55
9 0.78 0.45  # Elastic 0.35, Acoustic 0.45
e
