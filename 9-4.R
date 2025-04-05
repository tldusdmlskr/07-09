library(foreign)
library(dplyr)
library(ggplot2)
library(readxl)

#파생변수 만들기
welfare <- welfare %>%
  mutate(ageg = ifelse(age <30, "young",
                       ifelse(age <= 59, "middle", "old")))
table(welfare$ageg)
qplot(welfare$ageg)

#변수 간 관계 분석
ageg_income <- welfare %>%
  filter(!is.na(income)) %>%
  group_by(ageg) %>%
  summarise(mean_income = mean(income))
ageg_income

#그래프 만들기 
ggplot(data = ageg_income, aes(x = ageg, y = mean_income)) + geom_col()
#초년, 중년, 노년의 나이 순으로 정렬 
ggplot(data = ageg_income, aes(x = ageg, y = mean_income)) +
  geom_col() +
  scale_x_discrete(limits = c("young", "middle", "old"))
