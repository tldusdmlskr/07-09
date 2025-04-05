#변수 검토하기
library(foreign)
library(dplyr)
library(ggplot2)
library(readxl)

class(welfare$birth)
summary(welfare$birth)
qplot(welfare$birth)

#전처리
summary(welfare$birth)
table(is.na(welfare$birth))

welfare$birth <- ifelse(welfare$birth == 9999, NA, welfare$birth)
table(is.na(welfare$birth))

#파생변수 만들기 
welfare$age <- 2015- welfare$birth +1
summary(welfare$age)
qplot(welfare$age)

#나이에 따른 월급 평균표 만들기
age_income <- welfare %>%
  filter(!is.na(income)) %>%
  group_by(age) %>%
  summarise(mean_income = mean(income))

head(age_income) 

#그래프 그리기 
ggplot(data = age_income, aes(x = age, y = mean_income)) + geom_line()
