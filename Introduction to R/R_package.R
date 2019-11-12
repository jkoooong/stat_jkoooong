### PACKAGE�� �׷����׸���

#����PACKAGE_mtcars
boxplot(mtcars$mpg)
boxplot(mtcars$mpg , horizontal=TRUE) #������ȯ

?boxplot #?�� �̿��� �Լ� �ȿ� � argument�� �ִ��� ���캼 �� ����

plot(mtcars$wt, mtcars$mpg)
plot(mtcars$wt, mtcars$mpg, xlab="weight", ylab="mpg")


#����PACKAGE_iris
boxplot(iris$Sepal.Length)
boxplot(iris)

#����PACKAGE_cars
plot(cars$speed,cars$dist,main="CARS")
lines(cars)



#���� PACKAGE_ggplot2
install.packages("ggplot2")   #ggplot ��Ű�� ��ġ
library(ggplot2)              #ggplot ��Ű�� �ҷ�����

#���� PACKAGE_dplyr
#dplyr�� ��ġ�ϸ� fancy�� �׷����� �׸� �� ����
install.pacakage("dplyr")
library(dplyr)

mtcars %>% ggplot(aes(x=wt, y=mpg))+geom_point(aes(col=as.factor(cyl)))
mtcars %>% ggplot(aes(x=wt, y=mpg)) + geom_point()+ geom_smooth(method="lm") + geom_point(aes(col=as.factor(cyl)),size=5)
p <- mpg %>% ggplot(aes(class, hwy))
p + geom_boxplot()


#�� ȭ�鿡 �������� �׷��� �ֱ�
par(mfrow=c(1,2)) #1*2��� ���·� ����ڴٴ� ��
hist(cars$speed)
hist(cars$dist)

#���� ���
setwd("�۾����丮")
prac <- read.csv("prac.csv")
plot (prac$height, prac$weight, xlab="height", ylab="weight")
tab <- table(prac$weight)
barplot(tab)
pie(tab)
hist(prac$weight) #hist(prac$height)
