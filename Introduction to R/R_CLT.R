#1. CLT CODE
a=c(); b=c(); c=c(); d=c() # ���빰�� ���� ���� a,b,c,d ����

for (i in 1:5000){                       # 1���� 5000�� ����
  a[i] = mean(sample(1:2, 1))            # 1:2���� 1���� �̾� �� ����� a�� ����
  b[i] = mean(sample(1:2, 10, replace=T))# 1:2���� 10���� �̾� �� ����� b�� ����
  c[i] = mean(sample(1:2, 30, replace=T))# 1:2���� 30���� �̾� �� ����� c�� ����
  d[i] = mean(sample(1:2, 50, replace=T))# 1:2���� 50���� �̾� �� ����� d�� ����
}

par(mfrow=c(1,4))# ȭ���� 1*4�� ����
hist(a)
hist(b)
hist(c)
hist(d)

#2. CLT CODE_�ٸ� �������� ǥ�� �̱�_Uniform
a=c(); b=c(); c=c(); d=c()

for (i in 1:5000){
  a[i] = mean(runif(1,0,2)) # ǥ���� ���� ������ uniform ������ �д�.
  b[i] = mean(runif(10,0,2))
  c[i] = mean(runif(30,0,2))
  d[i] = mean(runif(100,0,2))
}

par(mfrow=c(1,4))
hist(a)
hist(b)
hist(c)
hist(d)

#3. CLT CODE_�ٸ� �������� ǥ�� �̱�_���׺���
a=c(); b=c(); c=c(); d=c()

for (i in 1:5000){
  a[i] = mean(rbinom(1,10,0.5)) # ǥ���� ���� ������ B(10, 0.5)�� ���׺����� �д�
  b[i] = mean(rbinom(10,10,0.5))
  c[i] = mean(rbinom(30,10,0.5))
  d[i] = mean(rbinom(100,10,0.5))
}

par(mfrow=c(1,4))
hist(a)
hist(b)
hist(c)
hist(d)

#4. CLT CODE_�ٸ� �������� ǥ�� �̱�_Pois
a=c(); b=c(); c=c(); d=c()

for (i in 1:5000){
  a[i] = mean(rpois(1,3))  # ǥ���� ���� ������ poi(3)�� ���Ƽۺ����� �д�
  b[i] = mean(rpois(10,3))
  c[i] = mean(rpois(30,3))
  d[i] = mean(rpois(100,3))
}

par(mfrow=c(1,4))
hist(a)
hist(b)
hist(c)
hist(d)

#5. CLT CODE_�ٸ� �������� ǥ�� �̱�_Exp
a=c(); b=c(); c=c(); d=c()

for (i in 1:5000){
  a[i] = mean(rexp(1,20))   # ǥ���� ���� ������ exp(20)�� ���������� �д�
  b[i] = mean(rexp(10,20))
  c[i] = mean(rexp(30,20))
  d[i] = mean(rexp(100,20))
}

par(mfrow=c(1,4))
hist(a)
hist(b)
hist(c)
hist(d)