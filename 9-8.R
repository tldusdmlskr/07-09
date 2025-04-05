#종교 유무 변수 검토하기
class(welfare$religion)
welfare$religion<-ifelse(welfare$religion==1, "yes", "no") 

qplot(welfare$religion)

#결혼 변수 검토하기/파생변수 만들기 
class(welfare$marriage)
welfare$group_marriage<-ifelse(welfare$marriage==1, "marriage", 
                               ifelse(welfare$marriage==3, "divorce", NA))
qplot(welfare$group_marriage)

#종교 유무에 따른 이혼율 분석하기 
religion_marriage<-welfare %>%
  filter(!is.na(group_marriage)) %>%
  group_by(religion, group_marriage) %>%
  summarise(n=n()) %>%
  mutate(tot_group=sum(n), 
         pct=round(n/tot_group*100,1))

divorce<-religion_marriage%>%
  filter(group_marriage=="divorce") %>%
  select(religion, pct)

#그래프 만들기 
ggplot(data=divorce, aes(x=religion, y=pct)) +geom_col()

#연령대 및 종교 유무에 따른 이혼율 분석하기
#연령대별 이혼율 표 만들기 
ageg_marriage<-welfare %>%
  filter(!is.na(group_marriage)) %>%
  group_by(ageg, group_marriage) %>%
  summarise(n=n()) %>%
  mutate(tot_group=sum(n),
         pct=round(n/tot_group*100,1))

#초년 제외, 이혼 추출 
ageg_divorce <- ageg_marriage %>%
  filter(ageg !="young"&group_marriage=="divorce") %>%
  select(ageg, pct)

#그래프 만들기 
ggplot(data=ageg_divorce, aes(x=ageg, y=pct)) + geom_col()

#연령대, 종교 유무, 결혼 상태별 비율표 만들기
ageg_religion_marriage<-welfare %>%
  filter(!is.na(group_marriage)&ageg!="young") %>%
  group_by(ageg, religion, group_marriage) %>%
  summarise(n=n()) %>%
  mutate(tot_group=sum(n),
         pct=round(n/tot_group*100,1))

#연령대 및 종교 유무별 이혼율 표 만들기 
df_divorce<-ageg_religion_marriage %>%
  filter(group_marriage=="divorce") %>%
  select(ageg, religion, pct)

ggplot(data=df_divorce, aes(x=ageg, y=pct, fill=religion)) +
  geom_col(position="dodge")


