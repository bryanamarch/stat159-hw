#loading all the packages used in this project. 
library(ggplot2)
library(testthat)
library(xtable)
library(png)

#Creating session-info.txt
sink(file = "session-info.txt")
sessionInfo()
sink()
