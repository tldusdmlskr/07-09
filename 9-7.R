#성별 직업 빈도표 만들기
#남성 직업 빈도 상위 10개 추출
job_male<-welfare %>%
  filter(!is.na(job)&sex=="male") %>%
  group_by(job) %>%
  summarise(n=n()) %>%
  arrange(desc(n)) %>%
  head(10)

#여성 직업 빈도 상위 10개 추출
job_female<-welfare %>%
  filter(!is.na(job)&sex=="female") %>%
  group_by(job) %>%
  summarise(n=n()) %>%
  arrange(desc(n)) %>%
  head(10)

#그래프 그리기

ggplot(data=job_male, aes(x=reorder(job,n), y=n)) +
  geom_col() +
  coord_flip()

ggplot(data=job_female, aes(x=reorder(job, n), y=n)) +
  geom_col() +
  coord_flip()
