library(ggplot2)

#x축은 displ, y축은 hwy로 지정해 배경 생성
ggplot(data = mpg, aes(x = displ, y = hwy))

#배경에 산점도 추가
#x축 범위 3~6, y축 범위 10~30으로 지정정
ggplot(data = mpg, aes(x = displ, y = hwy)) + 
  geom_point() + 
  xlim(3, 6) +
  ylim(10, 30) 

