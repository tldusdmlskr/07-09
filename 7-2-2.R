boxplot(mpg$hwy)
boxplot(mpg$hwy)$stats

mpg$hwy <- ifelse(mpg$hwy<12 | mpg$hwy > 37, NA, mpg$hwy)
table(is.na(mpg$hwy))

mpg %>%
  group_by(drv) %>%
  summarise(mean_hwy = mean(hwy, na.rm = T))