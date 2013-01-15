# We are only using first 3 columns, 1:epoch 2:temp 3:kernel
set term pngcairo size 1024,768
set output "temp.png"
set title "X220 temperature"
set xdata time
set key outside
set timefmt "%s"
set ytics 5
set format x "%d/%m"
archs = "`cut -d' ' -f3 temp.csv | sort -u | tr '\n' ' '`"
plot for [arch in archs] 'temp.csv' using 1:((strcol(3) == arch) ? $2:1/0) title arch
set term svg size 1024,768 dynamic
set output "temp.svg"
plot for [arch in archs] 'temp.csv' using 1:((strcol(3) == arch) ? $2:1/0) title arch
