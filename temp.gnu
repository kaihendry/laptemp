# We are only using first 3 columns, 1:epoch 2:temp 3:kernel
#set palette model RGB defined ( "3.8.1-1-mainline-dirty" 'red', "3.0.57-1-lts" 'green' )
set term svg
set title "X220 temperature"
set grid
set xdata time
set timefmt "%s"
set ytics 5
set format x "%d/%m"
plot 'temp.csv' u 1:($2/1000):3 with lines palette
