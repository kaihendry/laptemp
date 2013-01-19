set title "Laptop temperature"
set xdata time
set key outside
set timefmt "%s"
set ytics 2
set format x "%d/%m"
archs = "`cut -d' ' -f3 temp.csv | sort -u | tr '\n' ' '`"
plot for [arch in archs] 'temp.csv' using 1:((strcol(3) eq arch) ? ($2/1000):1/0) title arch with linespoints
