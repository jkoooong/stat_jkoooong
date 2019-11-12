#1. CLT CODE
a=c(); b=c(); c=c(); d=c() # 내용물이 없는 벡터 a,b,c,d 생성

for (i in 1:5000){                       # 1부터 5000에 대해
  a[i] = mean(sample(1:2, 1))            # 1:2에서 1개를 뽑아 그 평균을 a에 저장
  b[i] = mean(sample(1:2, 10, replace=T))# 1:2에서 10개를 뽑아 그 평균을 b에 저장
  c[i] = mean(sample(1:2, 30, replace=T))# 1:2에서 30개를 뽑아 그 평균을 c에 저장
  d[i] = mean(sample(1:2, 50, replace=T))# 1:2에서 50개를 뽑아 그 평균을 d에 저장
}

par(mfrow=c(1,4))# 화면을 1*4로 분할
hist(a)
hist(b)
hist(c)
hist(d)

#2. CLT CODE_다른 분포에서 표본 뽑기_Uniform
a=c(); b=c(); c=c(); d=c()

for (i in 1:5000){
  a[i] = mean(runif(1,0,2)) # 표본이 뽑힐 분포를 uniform 분포로 둔다.
  b[i] = mean(runif(10,0,2))
  c[i] = mean(runif(30,0,2))
  d[i] = mean(runif(100,0,2))
}

par(mfrow=c(1,4))
hist(a)
hist(b)
hist(c)
hist(d)

#3. CLT CODE_다른 분포에서 표본 뽑기_이항분포
a=c(); b=c(); c=c(); d=c()

for (i in 1:5000){
  a[i] = mean(rbinom(1,10,0.5)) # 표본이 뽑힐 분포를 B(10, 0.5)의 이항분포로 둔다
  b[i] = mean(rbinom(10,10,0.5))
  c[i] = mean(rbinom(30,10,0.5))
  d[i] = mean(rbinom(100,10,0.5))
}

par(mfrow=c(1,4))
hist(a)
hist(b)
hist(c)
hist(d)

#4. CLT CODE_다른 분포에서 표본 뽑기_Pois
a=c(); b=c(); c=c(); d=c()

for (i in 1:5000){
  a[i] = mean(rpois(1,3))  # 표본이 뽑힐 분포를 poi(3)의 포아송분포로 둔다
  b[i] = mean(rpois(10,3))
  c[i] = mean(rpois(30,3))
  d[i] = mean(rpois(100,3))
}

par(mfrow=c(1,4))
hist(a)
hist(b)
hist(c)
hist(d)

#5. CLT CODE_다른 분포에서 표본 뽑기_Exp
a=c(); b=c(); c=c(); d=c()

for (i in 1:5000){
  a[i] = mean(rexp(1,20))   # 표본이 뽑힐 분포를 exp(20)의 지수분포로 둔다
  b[i] = mean(rexp(10,20))
  c[i] = mean(rexp(30,20))
  d[i] = mean(rexp(100,20))
}

par(mfrow=c(1,4))
hist(a)
hist(b)
hist(c)
hist(d)
