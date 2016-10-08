.PHONY: all data clean 

rep = report/report.pdf
edao = data/eda-output.txt
regdat = data/regression.RData
Ad = data/Advertising.csv
rmd = report/report.Rmd

all: $(rep) $(edao) $(regdat)


data: 
	curl(http://www-bcf.usc.edu/~gareth/ISL/Advertising.csv) > $(Ad)


$(rep): $(rmd)
	Rscript -e "library(rmarkdown); render('$(rmd)')"

$(regdat): code/regression-script.R 
	Rscript -e "source('code/regression-script.R')"

$(edao): code/eda-script.R
	Rscript -e "source('code/eda-script.R')"

clean: 
	rm -f $(rep) 

