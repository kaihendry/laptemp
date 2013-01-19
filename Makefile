YESTERDAY=$(shell awk -v b="$$(date -d 'yesterday' +%s)" '{ if ($$1 >= b) print $$1 }' temp.csv | head -n1)

temp.png: temp.gnu temp.csv
	gnuplot -e 'set term pngcairo size 1024,768; set output "temp.png"' temp.gnu

yesterday: temp.gnu temp.csv
	gnuplot -p -e 'set xdata time; set timefmt "%s"; set xrange ["${YESTERDAY}":]' temp.gnu -

temp.csv:
	curl -s http://r2d2.webconverger.org/2012-12-27/temp.csv > temp.csv

clean:
	rm -f temp.png temp.csv

.PHONY: yesterday
