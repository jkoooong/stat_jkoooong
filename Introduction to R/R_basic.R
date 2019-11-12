### BASIC

# BASIC FUNCTION
3+2
3-2
3*2
3/2
3^2
3%%2
3%/%2


# Variable 할당
x <- 3
x

x <- 10:20 #여러 반복되는 숫자를 콜론을 이용하여 간단하게 실행할 수 있음
x

x <- c(1,2,3) #소괄호() 사이에 벡터를 구성하는 원소들을 콤마(,)로 구분해 입력으로 사용
x

y <- c("a", "b", "c") # 문자 변수의 경우 “ ”를 사용하여 입력
y


# Graph
subject <- c("mus","art", "art", "mov", "div", "mus", "mus", "mov", "art", "mov", "art", "mus", "mus") 
sub_table <- table(subject)
barplot(sub_table)
pie(sub_table)

ven <- c(2,1,3,0,1,1,0,2,1,0,2,1,0,2,0,1,0,1,0,2,4,5,1,0,3)
hist(ven) 
boxplot(ven)

jump <- c(2.3, 2.4, 2.5, 2.7, 2.8, 3.2, 3.6, 3.6, 4.5, 5.0) 
stem(jump)

#자료불러오기
rm(list=ls()) #전체 내용을 삭제하는 명령어
setwd("작업디렉토리") #작업환경 설정
# ex) setwd (" C:/Users/songdo/yonsei" )  
getwd() # 경로 확인 가능

prac <- read.csv("파일명.csv ") #CSV파일 불러오기 
prac


