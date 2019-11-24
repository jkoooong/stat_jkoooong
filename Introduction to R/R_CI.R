### CONFIDENCE INTERVAL

x_bar=c() #sample mean �����ϴ� ����
iter = 100 #sampling Ƚ��
inclu = rep(1,iter) #inclusion ���� �����ϴ� ����
for(i in 1:iter){
  x_bar[i] = mean(rnorm(100,0,1)) #N(0,1)���� ���� 100���� �̾� ����� ����
  lb = x_bar[i] - 1.96/10 #95% lower bound����
  ub = x_bar[i] + 1.96/10 #95% upper bound����
  if(lb<=0&&ub>=0) inclu[i] = 1 #���� [lower bound, upper bound]������
  #��� 0�� ���ٸ�, inclu�� 1�� �����ϰ�
  else inclu[i]=0 #�׷��� ������ 0�� �����Ѵ�.
  #(inclu�� ��� ������ ���� ���ϸ�,
  # 0�� ���Ե� Ƚ���� �ٷ� ���� �� �ִ�.)
}
x_bar
inclu
sum(inclu) #�ŷڱ��� �� ����� ������ ���� ����


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