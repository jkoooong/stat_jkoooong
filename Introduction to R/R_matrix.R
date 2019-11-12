# ����: matrix(data,nrow,ncol)
a <- matrix(1:6, 2, 3)
b <- c("one", "two", "three", "four", "five", "six")
c <- matrix(b, 2, 3, byrow=T) # byrow=T�� �̿��� data�� ��(row)���� ����
a
b
c


# ����
d <- matrix(1:6,3,2)
nrow(d) #���� ����
ncol(d) #���� ����
dim(d)  #���� ����, ���� ����
length(d) #������ ����


#����
e <- matrix(5:8, 2)  # ��� ���� 2�� ������ matrix
t(e)  #Transpose
d%*%e # 3*2 matrix d�� 2*2 matrix e�� ����                

#����
m <- matrix(c(1,3,2,1,5,3,1,7), 4, 2)
m
m[3,2]
m[c(1,3),2]
m[3,]
m[,1]
m[,-1]

#row name Ȥ�� column name�� �����ؼ� ������ �� ����
x <- matrix(1:12, 3, 4)
x
colnames(x) <- c("AA","BB","CC","DD")
x[,"BB"]

x[1:2,c(2,4)]
x[1:2,c(2,4)] <- 21:24
x

#����
y1 = c(1,2,3,4,5)
y2 = c(5,4,3,2,1)
y3 = c(1,0,0,0,1)
y_col = cbind(y1,y2,y3) #���η� ����
y_col1 = cbind(y2,y1,y3) #���η� ����
y_row = rbind(y1,y2,y3) #���η� ����


#���� ���
m1 <- m[,1] #��� m�� ù ��(column)�� ������ m1���� ����
m2 <- m[,2] #��� m�� �� ��° ���� ������ m2�� ����
new_m <- cbind(m2, m1) #m2, m1�� ������ new_m���� ���� 
m_sum <- m1+m2 #m1�� m2�� ���� ���� ����� m_sum���� ����
m_final <- cbind(m, m_sum) #��� m�� m_sum�� ������ m_final �� ����

