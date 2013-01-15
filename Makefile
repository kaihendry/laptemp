temp.svg: temp.gnu temp.csv
	gnuplot temp.gnu > temp.svg

debug: debug.gnu debug.csv
	gnuplot debug.gnu
	grep '2.28713e-317' debug.txt | wc -l

temp.csv:
	curl -s http://r2d2.webconverger.org/2012-12-27/temp.csv | awk '{print $$1 " " $$2/1000 " " $$3}' > temp.csv

view: temp.svg
	chromium temp.svg

clean:
	rm -f temp.svg temp.csv
