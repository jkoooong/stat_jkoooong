### random sample
sample(1:43, 10)  # 1 ~ 43에서 10개를 랜덤으로 추출
sample(1:21, 10, replace=FALSE) # 비복원추출, sample(1:21,10)과 동일
sample(1:21, 10, replace=TRUE) # 복원 추출

#내장데이터 iris 사용 example
index <- sample(1:nrow(iris),5)
index
iris_sample <- iris[index,]
iris_sample


### Discrete Random Variable
rbinom(10,100, 0.5)

dbinom(2,10,0.2)

#범위(size) 안의 점들의 dbinom을 모두 그리면 확률밀도함수의 형태 확인 가능
a <- seq(0, 50, by=1)             # size=50이므로 0부터 50으로 설정
b <- dbinom(a, 50, 0.2)
plot(a, b)

pbinom(3, 10, 0.2)
dbinom(0, 10, 0.2)+dbinom(1, 10, 0.2)+dbinom(2, 10, 0.2)+dbinom(3, 10, 0.2)

qbinom(0.6, 10, 0.2)
