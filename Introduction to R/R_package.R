### PACKAGE로 그래프그리기

#내장PACKAGE_mtcars
boxplot(mtcars$mpg)
boxplot(mtcars$mpg , horizontal=TRUE) #방향전환

?boxplot #?를 이용해 함수 안에 어떤 argument가 있는지 살펴볼 수 있음

plot(mtcars$wt, mtcars$mpg)
plot(mtcars$wt, mtcars$mpg, xlab="weight", ylab="mpg")


#내장PACKAGE_iris
boxplot(iris$Sepal.Length)
boxplot(iris)

#내장PACKAGE_cars
plot(cars$speed,cars$dist,main="CARS")
lines(cars)



#외장 PACKAGE_ggplot2
install.packages("ggplot2")   #ggplot 패키지 설치
library(ggplot2)              #ggplot 패키지 불러오기

#외장 PACKAGE_dplyr
#dplyr을 설치하면 fancy한 그래프도 그릴 수 있음
install.pacakage("dplyr")
library(dplyr)

mtcars %>% ggplot(aes(x=wt, y=mpg))+geom_point(aes(col=as.factor(cyl)))
mtcars %>% ggplot(aes(x=wt, y=mpg)) + geom_point()+ geom_smooth(method="lm") + geom_point(aes(col=as.factor(cyl)),size=5)
p <- mpg %>% ggplot(aes(class, hwy))
p + geom_boxplot()


#한 화면에 여러개의 그래프 넣기
par(mfrow=c(1,2)) #1*2행렬 형태로 만들겠다는 뜻
hist(cars$speed)
hist(cars$dist)

#과제 답안
setwd("작업디렉토리")
prac <- read.csv("prac.csv")
plot (prac$height, prac$weight, xlab="height", ylab="weight")
tab <- table(prac$weight)
barplot(tab)
pie(tab)
hist(prac$weight) #hist(prac$height)

