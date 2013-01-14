# We are only using first 3 columns, 1:epoch 2:temp 3:kernel
# awk '{print $3}' temp.csv  | sort -u
set term svg size 1024,708
set title "X220 temperature"
set xdata time
set key outside
set timefmt "%s"
set ytics 5
set format x "%d/%m"
plot "< awk '{if($3 == \"3.0.57-1-lts\") print}' temp.csv" u 1:2 t "3.0.57-1-lts" w p pt 2, \
     "< awk '{if($3 == \"3.6.10-1-ARCH\") print}' temp.csv" u 1:2 t "3.6.10-1-ARCH" w p pt 2, \
     "< awk '{if($3 == \"3.6.11-1-ARCH\") print}' temp.csv" u 1:2 t "3.6.11-1-ARCH" w p pt 2, \
     "< awk '{if($3 == \"3.8.1-1-mainline-dirty\") print}' temp.csv" u 1:2 t "3.8.1-1-mainline-dirty" w p pt 2
