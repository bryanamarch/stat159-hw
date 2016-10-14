.PHONY: all data clean tests eda regression report sesh

rep = report/report.pdf
regdat = data/regression.RData
Ad = data/Advertising.csv
rmd = report/report.Rmd
rep_html = report/report.html

all: eda regression report sesh


data:
	curl "http://www-bcf.usc.edu/~gareth/ISL/Advertising.csv" > $(Ad)

tests: 
	Rscript code/test-that.R

report: $(rmd) $(regdat)
	Rscript -e "library(rmarkdown); render('$(rmd)', output_format = 'pdf_document'); render('$(rmd)', output_format = 'html_document')"

regression: 
	Rscript code/scripts/regression-script.R

eda: 
	Rscript code/scripts/eda-script.R

sesh: 
	Rscript code/scripts/session-info-script.R

clean:
	rm -f $(rep) $(rep_html)


