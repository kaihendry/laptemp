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
plot for [arch in '3.0.57-1-lts 3.6.10-1-ARCH 3.6.11-1-ARCH 3.8.1-1-mainline-dirty'] \
  'temp.csv' using 1:((strcol(3) == arch) ? $2 : '?') title arch
