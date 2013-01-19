set title "Laptop temperature"
set xdata time
set key outside
set timefmt "%s"
set ytics 5
set format x "%d/%m"
archs = "`cut -d' ' -f3 temp.csv | sort -u | tr '\n' ' '`"
plot for [arch in archs] 'temp.csv' using 1:((strcol(3) eq arch) ? $2:1/0) title arch
