### Mathematical function
log(42) #로그
exp(10) #지수
factorial(4) #factorial
round(pi, digit=5) #반올림
cos(pi/2) #cosine
sin(pi/2) #sine
tan(pi/2) #tangent
abs(-4) #절댓값

### 중심위치 척도
credit <- c(9,12,15,15,18,18,18,18,18,21)

mean(credit) #평균
median(credit) #중앙값
table(credit) # 빈도수
quantile(credit) #4분위수

### 변동성 척도
range(credit) #최솟값, 최댓값
min(credit) #최솟값
max(credit) #최댓값 
IQR(credit) #4분위범위
var(credit) #분산
sd(credit) #표준편차

##연관성척도
grade <- c(4, 3, 3, 2, 2, 2, 2, 1, 1, 1)

cov(credit, grade)
cor(credit, grade)

## 과제 답안
grade <- c(4, 3, 3, 2, 2, 2, 2, 1, 1, 1)

mean(grade)
median(grade)
var(grade)
v<-var(grade)
sqrt(v)
sd(grade)

