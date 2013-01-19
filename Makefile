temp.png: temp.gnu temp.csv
	gnuplot -e 'set term pngcairo size 1024,768; set output "temp.png"' temp.gnu

temp.csv:
	curl -s http://r2d2.webconverger.org/2012-12-27/temp.csv > temp.csv

clean:
	rm -f temp.png temp.csv
