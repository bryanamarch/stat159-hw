#Loading data
advertising <- read.csv("data/Advertising.csv")

#Least squares regression analysis 
ls_reg <- lm(Sales ~ TV + Radio + Newspaper, data = advertising)
summary_ls <- summary(ls_reg)

#Storing the least sqaures objects in the RData file. 
save(ls_reg, summary_ls, file = "data/regression.RData")

#Creating the scatterplot images
require(ggplot2)

#Using a simplified model to find out predicted y values from the regression analysis with just TV. 
pre_TV <- predict(lm(Sales ~ TV, data = advertising)) 

png("images/scatterplot-tv-sales.png")
ggplot(advertising, aes(TV, Sales))+
  geom_smooth(method = "lm", se = FALSE, size = 1) +
  geom_point(shape = 16, col = "red")+
  geom_segment(aes(xend = TV, yend = pre_TV), alpha = .2)+
  theme_bw()
dev.off()

#Using a simplified model to find out predicted y values from the regression analysis with just TV. 
pre_radio <- predict(lm(Sales ~ Radio, data = advertising)) 

png("images/scatterplot-radio-sales.png")
ggplot(advertising, aes(Radio, Sales))+
  geom_smooth(method = "lm", se = FALSE, size = 1, col = "green") +
  geom_point(shape = 16, col = "purple")+
  geom_segment(aes(xend = Radio, yend = pre_radio), alpha = .2)+
  theme_bw()
dev.off()

#Using a simplified model to find out predicted y values from the regression analysis with just TV. 
pre_news <- predict(lm(Sales ~ Newspaper, data = advertising)) 

png("images/scatterplot-newspaper-sales.png")
ggplot(advertising, aes(Newspaper, Sales))+
  geom_smooth(method = "lm", se = FALSE, size = 1, col = "magenta")+
  geom_segment(aes(xend = Newspaper, yend = pre_news), alpha = .2)+
  geom_point(shape = 16, col = "orange")+
  theme_bw()
dev.off()

#Now to create the diagnostic plots. 
#This is the Residuals vs. Fitted values plot. 
png("images/residual-plot.png")
plot(ls_reg, which = 1)
dev.off()

#This is the Scale-Location plot. 
png("images/scale-location-plot.png")
plot(ls_reg, which = 3)
dev.off()

#This is the Normal Q-Q plot. 
png("images/normal-qq-plot.png")
plot(ls_reg, which = 2)
dev.off()