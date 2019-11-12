# 생성: matrix(data,nrow,ncol)
a <- matrix(1:6, 2, 3)
b <- c("one", "two", "three", "four", "five", "six")
c <- matrix(b, 2, 3, byrow=T) # byrow=T를 이용해 data를 행(row)별로 나열
a
b
c


# 성질
d <- matrix(1:6,3,2)
nrow(d) #행의 개수
ncol(d) #열의 개수
dim(d)  #행의 개수, 열의 개수
length(d) #원소의 개수


#연산
e <- matrix(5:8, 2)  # 행과 열이 2로 동일한 matrix
t(e)  #Transpose
d%*%e # 3*2 matrix d와 2*2 matrix e를 곱함                

#추출
m <- matrix(c(1,3,2,1,5,3,1,7), 4, 2)
m
m[3,2]
m[c(1,3),2]
m[3,]
m[,1]
m[,-1]

#row name 혹은 column name을 지정해서 추출할 수 있음
x <- matrix(1:12, 3, 4)
x
colnames(x) <- c("AA","BB","CC","DD")
x[,"BB"]

x[1:2,c(2,4)]
x[1:2,c(2,4)] <- 21:24
x

#결합
y1 = c(1,2,3,4,5)
y2 = c(5,4,3,2,1)
y3 = c(1,0,0,0,1)
y_col = cbind(y1,y2,y3) #세로로 결합
y_col1 = cbind(y2,y1,y3) #세로로 결합
y_row = rbind(y1,y2,y3) #가로로 결합


#과제 답안
m1 <- m[,1] #행렬 m의 첫 열(column)을 추출해 m1으로 저장
m2 <- m[,2] #행렬 m의 두 번째 열을 추출해 m2로 저장
new_m <- cbind(m2, m1) #m2, m1을 결합해 new_m으로 저장 
m_sum <- m1+m2 #m1과 m2를 더한 열을 만들어 m_sum으로 저장
m_final <- cbind(m, m_sum) #행렬 m에 m_sum을 겹합해 m_final 로 저장


