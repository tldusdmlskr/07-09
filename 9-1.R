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

welfare <- rename(welfare,
                  sex = h10_g3,
                  birth = h10_g4,
                  marriage = h10_g10,
                  religion = h10_g11,
                  income = p1002_8aq1,
                  code_job = h10_eco9,
                  code_region = h10_reg7)

class(welfare$sex)
## [1] "numeric"

table(welfare$sex)
##    1    2 
## 7578 9086 

table(welfare$sex)

#이상치 결측 처리
welfare$sex <- ifelse(welfare$sex == 9, NA, welfare$sex)
## FALSE

#결측치 확인 
table(is.na(welfare$sex))
## 16664 

#성별 항목 이름 부여
welfare$sex <- ifelse(welfare$sex == 1, "male", "female")
table(welfare$sex)

qplot(welfare$sex)

class(welfare$income)
## [1] "numeric"

summary(welfare$income)
##    Min. 1st Qu.  Median    Mean 3rd Qu.    Max.    NA's 
##    0.0   122.0   192.5   241.6   316.6  2400.0   12030 

qplot(welfare$income) + xlim(0, 1000)

summary(welfare$income)
#이상치 결측 처리
welfare$income <- ifelse(welfare$income %>% c(0,9999),NA, welfare$income)
#결측치 확인
table(is.na(welfare$income))

sex_income <- welfare %>%
  filter(!is.na(income)) %>%
  group_by(sex) %>%
  summarise(mean_income = mean(income))

sex_income

ggplot(data = sex_income, aes(x = sex, y = mean_income)) + geom_col()
