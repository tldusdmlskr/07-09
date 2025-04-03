library(dplyr)

df_mpg <- mpg %>%
  group_by(drv) %>%
  summarise(mean_hwy = mean(hwy))

df_mpg

df_mpg$mean_hwy <- ifelse(is.na(df_mpg$mean_hwy), 28.2, df_mpg$mean_hwy)

ggplot(data = df_mpg, aes(x = drv, y = mean_hwy)) + geom_col()

ggplot(data = df_mpg, aes(x = reorder(drv, -mean_hwy), y = mean_hwy)) +geom_col()

ggplot(data = df_mpg, aes(x = drv, y = mean_hwy)) + geom_bar()
