### random sample
sample(1:43, 10)  # 1 ~ 43���� 10���� �������� ����
sample(1:21, 10, replace=FALSE) # �񺹿�����, sample(1:21,10)�� ����
sample(1:21, 10, replace=TRUE) # ���� ����

#���嵥���� iris ��� example
index <- sample(1:nrow(iris),5)
index
iris_sample <- iris[index,]
iris_sample


### Discrete Random Variable
rbinom(10,100, 0.5)

dbinom(2,10,0.2)

#����(size) ���� ������ dbinom�� ��� �׸��� Ȯ���е��Լ��� ���� Ȯ�� ����
a <- seq(0, 50, by=1)             # size=50�̹Ƿ� 0���� 50���� ����
b <- dbinom(a, 50, 0.2)
plot(a, b)

pbinom(3, 10, 0.2)
dbinom(0, 10, 0.2)+dbinom(1, 10, 0.2)+dbinom(2, 10, 0.2)+dbinom(3, 10, 0.2)

qbinom(0.6, 10, 0.2)