temp.png: temp.gnu temp.csv
	gnuplot temp.gnu

temp.csv:
	# We are only using first 3 columns, 1:epoch 2:temp 3:kernel
	curl -s http://r2d2.webconverger.org/2012-12-27/temp.csv | awk '{print $$1 " " $$2/1000 " " $$3}' > temp.csv

clean:
	rm -f temp.png temp.csv
