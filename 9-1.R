install.packages("foreign")

library(foreign)
library(dplyr)
library(ggplot2)
library(readxl)

#데이터 불러오기
raw_welfare <- read.spss(file = "C:/Users/USER/Documents/GitHub/Koweps_hpc10_2015_beta1.sav",
                         to.data.frame = T)

welfare <- raw_welfare

head(welfare)
tail(welfare)
View(welfare)
dim(welfare)
str(welfare)
summary(welfare)
