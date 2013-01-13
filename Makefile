temp.svg: temp.gnu temp.csv refresh
	gnuplot temp.gnu > temp.svg

refresh:
	wget -N http://r2d2.webconverger.org/2012-12-27/temp.csv

view: temp.svg
	chromium temp.svg

clean:
	rm -f temp.svg
