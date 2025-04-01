df <- data.frame(sex = c("M", "F", NA, "M", "F"),
                 score = c(5, 4, 3, 4, NA))
df

is.na(df)
table(is.na(df))
table(is.na(df$sex))
table(is.na(df$score))

library(dplyr)
df %>% filter(is.na(score))
df %>% filter(!is.na(score))

mean(df$score)
sum(df$score)

df_nomiss <- df %>% filter(!is.na(score))
mean(df_nomiss$score)
sum(df_nomiss$score)

df_nomiss <- df %>% filter(!is.na(score) & !is.na(sex))
df_nomiss

df_nomiss2 <- na.omit(df)
df_nomiss2

mean(df$score, na.rm = T) #결측치 제외하고 평균 산출 
sum(df$score, na.rm = T) #결측치 제외하고 합계 산출 

exam <- read.csv("csv_exam.csv")
exam[c(3, 8, 15), "math"] <- NA #3, 8, 15행의 math에 NA 할당
exam

exam %>% summarise(mean_math = mean(math)) #math 평균 산출

#math 결측치 제외하고 평균 산출
exam %>% summarise(mean_math = mean(math, na.rm = T))

exam %>% summarise(mean_math = mean(math, na.rm = T),
                   sum_math = sum(math, na.rm = T),
                   median_math = median(math, na.rm = T))

mean(exam$math, na.rm = T) #결측치 제외하고 math 평균 산출 

exam$math <- ifelse(is.na(exam$math), 55, exam$math) #math가 NA면 55로 대체
table(is.na(exam$math)) #결측치 빈도표 생성 

exam

mean(exam$math)
