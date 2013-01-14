# We are only using first 3 columns, 1:epoch 2:temp 3:kernel
# awk '{print $3}' temp.csv  | sort -u
set term svg size 1024,708
set title "X220 temperature"
set xdata time
set key outside
set timefmt "%s"
set ytics 5
set format x "%d/%m"
set style data linespoints
archs = "`cut -d' ' -f3 temp.csv | sort -u | xargs echo`"
plot for [arch in archs] \
  'temp.csv' using 1:((strcol(3) == arch) ? $2 : '?') title arch
