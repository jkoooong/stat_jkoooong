### BASIC

# BASIC FUNCTION
3+2
3-2
3*2
3/2
3^2
3%%2
3%/%2


# Variable �Ҵ�
x <- 3
x

x <- 10:20 #���� �ݺ��Ǵ� ���ڸ� �ݷ��� �̿��Ͽ� �����ϰ� ������ �� ����
x

x <- c(1,2,3) #�Ұ�ȣ() ���̿� ���͸� �����ϴ� ���ҵ��� �޸�(,)�� ������ �Է����� ���
x

y <- c("a", "b", "c") # ���� ������ ��� �� ���� ����Ͽ� �Է�
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

#�ڷ�ҷ�����
rm(list=ls()) #��ü ������ �����ϴ� ���ɾ�
setwd("�۾����丮") #�۾�ȯ�� ����
# ex) setwd (" C:/Users/songdo/yonsei" )  
getwd() # ��� Ȯ�� ����

prac <- read.csv("���ϸ�.csv ") #CSV���� �ҷ����� 
prac

