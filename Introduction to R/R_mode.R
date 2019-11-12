### Object Mode
#Numeric
a <- 3        # integer
b <- -100     # integer
c <- 0.34982  # double
mode(c)       # numeric 출력

#Character
d <- "black_pink"
e <- "Hit you with that ddu-du ddu-du du"
f <- "3"
mode(f) # 숫자가 따옴표 안에 들어가 있으므로, Character로 인식

#Logical
d <- "black_pink"       # 변수 지정
d == "black_pink" # 변수 d의 값이 black_pink인지 확인, d = black_pink이므로 TRUE 출력
d == "Wannaone" # d = black_pink이므로 FALSE 출력


### Converting Object Mode
# 문자형 -> 숫자형
f <- "3"
ff <- as.numeric(f)
mode(ff)
ff

# 문자형 -> logical
mode("TRUE")
t <- as.logical("TRUE")
t
mode(t)

### Bitwise Operators
TRUE & TRUE # TRUE
TRUE & FALSE # FALSE
TRUE | FALSE  # TRUE
FALSE | FALSE # FALSE


### 과제 답안
obj<-50
#obj가 50과 같은지, 다른지 비교하기
obj==50
obj!=50
#obj가 30보다 큰지, 작은지 비교하기
obj>30
obj<30
#obj가 40보다 크고(and) 60보다 작은지 비교하기
obj>40 & obj<60
#obj가 40보다 작거나(or) 60보다 큰지 비교하기
obj<40 | obj>60


                