Code

This directory contains the exploratory code for the analysis. This directory contains three directories and one stand alone file.
Scripts:  
* eda-script.R which creates eda-output.txt and creates the images of histograms. This code is used to explore the variables to be used in the linear regression to see if they are good candidates for a linear model.
* regression-script.R which produces the regression analysis and also exports images of the scatterplots and of the different lm plots (residual, scale-location, normal q-q). 
* session-info-script.R which exports the infoSession() output into a separate text file session-info.txt

Functions: 
* ression-functions.R which contains several functions that calculate statistics on a least squares regression object. 

Tests: 
* test-regression.R which has tests via testthat that test whether the functions of regression-functions.R are calculating correctly. 

test-that.R: 
This file runs the code of the test function test-regression.R. This script essentially runs the test of the functions.  
