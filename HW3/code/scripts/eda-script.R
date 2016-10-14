#Loading data
advertising <- read.csv("data/Advertising.csv")


#Creating the summary text file
sink(file = "data/eda-output.txt")
cat("These are the summary statistics for product sales\n")
summary(advertising$Sales)
cat("\nThese are the summary statistics for TV advertising budgets\n")
summary(advertising$TV)
cat("\nThese are the summary statistics for Radio advertising budgets\n")
summary(advertising$Radio)
cat("\nThese are the summary statistics for Newpaper advertising budgets\n")
summary(advertising$Newspaper)
cat("\nThis is the correlation matrix for all of the variables\n")
cor(advertising)
sink()

#Saving the correlation matrix in the RData file correlation-matrix.RData
Cor <- cor(advertising)
Cor[lower.tri(Cor)] <- NA
save(Cor, file = "data/correlation-matrix.RData")

#Creating histograms and loading them to the images folder. 
require(ggplot2)

png(filename = "images/histogram-sales.png")
ggplot(data = advertising) +
  geom_histogram(aes(Sales), binwidth = 2, col = "white", fill = "darkgreen") +
  xlab("Product Sales") +
  ylab("Count")
dev.off()

png(filename = "images/histogram-tv.png")
ggplot(data = advertising) +
  geom_histogram(aes(TV), binwidth = 40, col = "white", fill = "purple") +
  xlab("TV Advertising Budgets") +
  ylab("Count")
dev.off()

png(filename = "images/histogram-radio.png")
ggplot(data = advertising) +
  geom_histogram(aes(TV), binwidth = 40, col = "white", fill = "aquamarine") +
  xlab("Radio Advertising Budgets") +
  ylab("Count")
dev.off()

png(filename = "images/histogram-newspaper.png")
ggplot(data = advertising) +
  geom_histogram(aes(TV), binwidth = 40, col = "white", fill = "orange") +
  xlab("Newspaper Advertising Budgets") +
  ylab("Count")
dev.off()

png(filename = "images/scatterplot-matrix.png")
pairs(advertising, col = "dark blue")
dev.off()
