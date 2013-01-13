# We are only using first 3 columns, 1:epoch 2:temp 3:kernel
set term svg size 600,400 dynamic enhanced fname 'arial' fsize 11 butt solid
set title "X220 temperature"
set xdata time
set timefmt "%s"
set format x "%d/%m"
plot 'temp.csv' using 1:($2/1000):3 with lines
