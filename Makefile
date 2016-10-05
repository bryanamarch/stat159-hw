.PHONY: all data clean 

rep = report/report.pdf
edao = data/eda-output.txt
regdat = data/regression.RData
Ad = data/Advertising.csv

all: $(rep) $(edao) $(regdat)


data: 
	curl(http://www-bcf.usc.edu/~gareth/ISL/Advertising.csv) > $(Ad)


$(rep): report/report.Rmd $(regdat) images/scatterplot-tv-sales.png

$(regdat): code/regression-script.R $(Ad)

$(edao): code/eda-script.R $(Ad)


clean: 
	rm -f report/report.pdf 

