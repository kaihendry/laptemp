set terminal png size 800,200
set title "X220 temperature"
set xdata time
set timefmt "%s"
set format x "%H:%M:%S" # or whatever
plot 'temp.csv' using 1:2 title "Temp" with lines
