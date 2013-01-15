# We are only using first 3 columns, 1:epoch 2:temp 3:kernel
# awk '{print $3}' temp.csv  | sort -u
# 3.0.57-1-lts
# 3.6.10-1-ARCH
# 3.6.11-1-ARCH
# 3.8.1-1-mainline-dirty
set term pngcairo size 1024,768
set output "temp.png"
set title "X220 temperature"
set xdata time
set key off
set timefmt "%s"
set ytics 5
set format x "%d/%m"
#plot 'temp.csv' <options> title 'first value', '' using 1:(1/0) lc <color> title 'second value', '' using 1:(1/0) lc <color> title 'third value'
rgb(r,g,b)=int(2**16*(2**8*r) + 2**8*(2**8*g) + (2**8*b))
getcolor(string) = (string eq "3.0.57-1-lts" ? rgb(1,0,0) : string eq "3.6.10-1-ARCH" ? rgb(0.5,0,1) : string eq "3.6.11-1-ARCH" ? rgb(0,1,0.5) : rgb(0,0,0));

#plot 'temp.csv' using 1:2:(getcolor(stringcolumn(3))) with linespoints lc variable
#plot 'temp.csv' using 1:2:(getcolor(stringcolumn(3))) with linespoints lc variable
plot 'temp.csv' using 1:2:(getcolor(stringcolumn(3))) w l lc rgbcolor variable
