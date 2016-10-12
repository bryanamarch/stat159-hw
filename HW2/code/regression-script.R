#Loading data
advertising <- read.csv("data/Advertising.csv")

#Least squares regression analysis 
ls_reg <- lm(Sales ~ TV, data = advertising)
summary_ls <- summary(ls_reg)

#Storing the least sqaures objects in the RData file. 
save(ls_reg, summary_ls, file = "data/regression.RData")

#Creating the scatterplot images
require(ggplot2)

#finding out predicted y values from the regression analysis. 
pre <- predict(ls_reg) 

png("images/scatterplot-tv-sales.png")
ggplot(advertising, aes(TV, Sales))+
  geom_smooth(method = "lm", se = FALSE, size = 1) +
  geom_point(shape = 16, col = "red")+
  geom_segment(aes(xend = TV, yend = pre), alpha = .2)+
  theme_bw()
dev.off()

pdf("images/scatterplot-tv-sales.pdf")
ggplot(advertising, aes(TV, Sales))+
  geom_smooth(method = "lm", se = FALSE, size = 1) +
  geom_point(shape = 16, col = "red")+
  geom_segment(aes(xend = TV, yend = pre), alpha = .2)+
  theme_bw()
dev.off()


