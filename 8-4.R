library(ggplot2)

ggplot(data = economics, aes(x = date, y = unemploy)) + geom_line()

ggplot(data = mpg, aes(x = drv, y = hwy)) + geom_boxplot()
