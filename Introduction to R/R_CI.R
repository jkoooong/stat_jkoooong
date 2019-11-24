### CONFIDENCE INTERVAL

x_bar=c() #sample mean 저장하는 벡터
iter = 100 #sampling 횟수
inclu = rep(1,iter) #inclusion 여부 저장하는 벡터
for(i in 1:iter){
  x_bar[i] = mean(rnorm(100,0,1)) #N(0,1)에서 난수 100개를 뽑아 평균을 구함
  lb = x_bar[i] - 1.96/10 #95% lower bound구함
  ub = x_bar[i] + 1.96/10 #95% upper bound구함
  if(lb<=0&&ub>=0) inclu[i] = 1 #만약 [lower bound, upper bound]구간에
  #모수 0이 들어간다면, inclu에 1을 저장하고
  else inclu[i]=0 #그렇지 않으면 0을 저장한다.
  #(inclu의 모든 원소의 합을 더하면,
  # 0이 포함된 횟수를 바로 구할 수 있다.)
}
x_bar
inclu
sum(inclu) #신뢰구간 중 모수를 포함한 것의 갯수


curve(0*x,xlim=c(0,iter),ylim=c(-0.5,0.5), xlab="iteration",
      ylab="interval", main="95% confidence interval")

for(i in 1:iter){
  x_bar[i] = mean(rnorm(100,0,1))
  lb = x_bar[i] - 1.96/10
  ub = x_bar[i] + 1.96/10
  if(lb<=0&&ub>=0){
    inclu[i] = 1
    segments(i,lb,i,ub)
  }
  else{
    inclu[i]=0
    segments(i,lb,i,ub,col="2")
  }
}
sum(inclu)
