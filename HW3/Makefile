#This lets make know which targets are not files
.PHONY: all data clean tests eda regression report sesh

#creating variables of files so that the values might be changed easily
rep = report/report.pdf
regdat = data/regression.RData
Ad = data/Advertising.csv
rmd = report/report.Rmd
rep_html = report/report.html

#This target tells make what targets to run when you run make by itself. 
all: eda regression report sesh

#This target loads in the data
data:
	curl "http://www-bcf.usc.edu/~gareth/ISL/Advertising.csv" > $(Ad)

#This target runs the tests that check whether the regression functions are working well. 
tests: 
	Rscript code/test-that.R

#This target creates the pdf and html versions of the report. 
report: $(rmd) $(regdat)
	Rscript -e "library(rmarkdown); render('$(rmd)', output_format = 'pdf_document'); render('$(rmd)', output_format = 'html_document')"

#This target runs the script regression-script.R that outputs plot images and regression statistics
regression: 
	Rscript code/scripts/regression-script.R

#This target runs the script eda-script.R which outputs plot images and exploratory data analysis statistics.
eda: 
	Rscript code/scripts/eda-script.R

#This target runs the script session-info-script.R which produces information about the R session. 
sesh: 
	Rscript code/scripts/session-info-script.R

#This target deletes the report pdf and html outputs created by the target report. 
clean:
	rm -f $(rep) $(rep_html)


