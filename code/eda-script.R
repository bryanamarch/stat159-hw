#Loading data
advertising <- read.csv("data/Advertising.csv")


#Creating the summary text file
sink(file = "data/eda_output.txt")
cat("These are the summary statistics for TV advertising budgets\n")
summary(advertising$TV)
cat("\nThese are the summary statistics for product sales\n")
summary(advertising$Sales)
sink()

#Creating histograms and loading them to the images folder. 
require(ggplot2)

png(filename = "images/histogram-tv.png")
ggplot(data = advertising) +
  geom_histogram(aes(TV), binwidth = 50, col = "white", fill = "purple") +
  xlab("TV Advertising Budgets") +
  ylab("Count")
dev.off()
  
pdf(file = "images/histogram-tv.pdf")
ggplot(data = advertising) +
  geom_histogram(aes(TV), binwidth = 50, col = "white", fill = "purple") +
  xlab("TV Advertising Budgets") +
  ylab("Count")
dev.off()

png(filename = "images/histogram-sales.png")
ggplot(data = advertising) +
  geom_histogram(aes(Sales), binwidth = 2, col = "white", fill = "darkgreen") +
  xlab("Product Sales") +
  ylab("Count")
dev.off()

pdf(file = "images/histogram-sales.pdf")
ggplot(data = advertising) +
  geom_histogram(aes(Sales), binwidth = 2, col = "white", fill = "darkgreen") +
  xlab("Product Sales") +
  ylab("Count")
dev.off()
