temp.png: temp.gnu temp.csv
	gnuplot temp.gnu > temp.png

clean:
	rm -f temp.png
