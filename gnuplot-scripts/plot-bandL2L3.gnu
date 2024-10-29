set terminal pngcairo
set output 'band-L2L3.png'

set logscale y
set ylabel 'Cache (Memory) Bandwidth (GByte/s)'
set yrange[0:15000]
set boxwidth 0.2  
set style fill solid 0.5  
set xtics rotate by -45  
set ytics font "Times-New-Roman,10"
set xtics font "Times-New-Roman,10"
set xlabel font "Times-New-Roman,10"
set ylabel font "Times-New-Roman,10"

set key at screen 0.4925, 0.94 
set key font "Times-New-Roman,10"
set key box

bandwidth = 117.52940        
max_band_label = "stream\\_mem\\_avx\\_fma"
max_band_label_offset = 50
set label at screen 0.18, 0.79 sprintf("Maximum Memory Bandwidth: %.2f GByte/s", bandwidth) font "Times-New-Roman,10"
set label at screen 0.18, 0.76 sprintf("(%s)",max_band_label) font "Times-New-Roman,10"


set xtics ("order=4, cells=0.01M" 1, "order=4, cells=0.10M" 2, "order=4, cells=1.00M" 3, \
           "order=6, cells=0.01M" 4, "order=6, cells=0.10M" 5, "order=6, cells=1.00M" 6, \
           "order=8, cells=0.01M" 7, "order=8, cells=0.10M" 8, "order=8, cells=1.00M" 9)


plot \
    '-' using ($1-0.3):2 with boxes linecolor rgb 'blue' title 'elastic, L3 to L2', \
    '' using ($1-0.1):2 with boxes linecolor rgb 'red' title 'acoustic, L3 to L2', \
    '' using ($1+0.1):2 with boxes linecolor rgb 'orange' title 'elastic, L2 to L3', \
    '' using ($1+0.3):2 with boxes linecolor rgb 'green' title 'acoustic, L2 to L3', \
    (117.5294) with lines lw 2 lc rgb 'black' dt 2 notitle


# elastic L3 to L2
# Order 4
1 72.52904708 0.3  # Elastic 0.2, Acoustic 0.3
2 2.553083562 0.35  # Elastic 0.25, Acoustic 0.35
3 59.77830542 0.25  # Elastic 0.15, Acoustic 0.25
# Order 6
4 55.35431036 0.4  # Elastic 0.3, Acoustic 0.4
5 68.87178716 0.45  # Elastic 0.35, Acoustic 0.45
6 78.47084503 0.35  # Elastic 0.25, Acoustic 0.35
# Order 8
7 203.7463476 0.5  # Elastic 0.4, Acoustic 0.5
8 212.4891637 0.55  # Elastic 0.45, Acoustic 0.55
9 207.3729043 0.45  # Elastic 0.35, Acoustic 0.45
e
# acoustic L3 to L2
# Order 4
1 60.29136534 0.3  # Elastic 0.2, Acoustic 0.3
2 39.75744697 0.35  # Elastic 0.25, Acoustic 0.35
3 1.520270996 0.25  # Elastic 0.15, Acoustic 0.25
# Order 6
4 71.11790718 0.4  # Elastic 0.3, Acoustic 0.4
5 87.89719251 0.45  # Elastic 0.35, Acoustic 0.45
6 90.07740344 0.35  # Elastic 0.25, Acoustic 0.35
# Order 8
7 347.8370194 0.5  # Elastic 0.4, Acoustic 0.5
8 353.9936719 0.55  # Elastic 0.45, Acoustic 0.55
9 321.0974331 0.45  # Elastic 0.35, Acoustic 0.45
e
# elastic L2 to L3
# Order 4
1 12.28980117 0.3  # Elastic 0.2, Acoustic 0.3
2 0.389202919 0.35  # Elastic 0.25, Acoustic 0.35
3 9.856184261 0.25  # Elastic 0.15, Acoustic 0.25
# Order 6
4 7.992760127 0.4  # Elastic 0.3, Acoustic 0.4
5 7.81944239 0.45  # Elastic 0.35, Acoustic 0.45
6 8.056337342 0.35  # Elastic 0.25, Acoustic 0.35
# Order 8
7 8.597924501 0.5  # Elastic 0.4, Acoustic 0.5
8 8.931037981 0.55  # Elastic 0.45, Acoustic 0.55
9 9.015656222 0.45  # Elastic 0.35, Acoustic 0.45
e
# acoustic L2 to L3
# Order 4
1 10.49648894 0.3  # Elastic 0.2, Acoustic 0.3
2 8.887425339 0.35  # Elastic 0.25, Acoustic 0.35
3 0.320479227 0.25  # Elastic 0.15, Acoustic 0.25
# Order 6
4 6.757697235 0.4  # Elastic 0.3, Acoustic 0.4
5 6.787814612 0.45  # Elastic 0.35, Acoustic 0.45
6 7.004505031 0.35  # Elastic 0.25, Acoustic 0.35
# Order 8
7 7.200349291 0.5  # Elastic 0.4, Acoustic 0.5
8 6.831995477 0.55  # Elastic 0.45, Acoustic 0.55
9 6.706139165 0.45  # Elastic 0.35, Acoustic 0.45
e
