set terminal png size 800,200
set title "X220 temperature"
set yrange[-0.5:1.5]
set clip two
set ytics (0,1)
set xdata time
set xtics 9676800
set timefmt "%s"
plot 'temp.csv' using 1:2 title "Temp" with lines
