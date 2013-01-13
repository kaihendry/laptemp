temp.png: temp.gnu temp.csv refresh
	gnuplot temp.gnu > temp.png

refresh:
	wget -N http://r2d2.webconverger.org/2012-12-27/temp.csv

view:
	sxiv temp.png

clean:
	rm -f temp.png
