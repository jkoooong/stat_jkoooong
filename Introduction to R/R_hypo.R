### EXAMPLE1
stat <- (840-850) / (50/sqrt(25)) #검정통계량
cv <- qnorm(0.05, lower=TRUE) #critical value
#검정통계량 값이 임계값보다 안쪽에 있으므로, 귀무가설 기각 못함

pnorm(stat, lower=TRUE) #p-value
#(p-value)=0.15 > 0.05=(유의수준)이므로  귀무가설 기각 못함


### EXAMPLE2
samp <- c(1.8, 10.6, -1.2, 12.9, 15.1, -2.0, 6.25, 10.8)
stat <- (mean(samp)-15) / (sd(samp)/sqrt(8)) 
cv <- qt(0.025, 7)
#검정통계량 값이 임계값보다 바깥쪽에 있으므로, 귀무가설 기각

samp <- c(1.8, 10.6, -1.2, 12.9, 15.1, -2.0, 6.25, 10.8)  
t.test(samp, mu=15)
#(p-value)=0.009 < 0.05=(유의수준)이므로  귀무가설 기각


### EXAMPLE3
x <- c(215, 258, 248, 270, 291, 299, 244, 265, 250, 260)
y <- c(257, 284, 305, 308, 320, 240, 248, 278, 280, 280)
diff <- mean(x) - mean(y)
m <- length(x)
n <- length(y)
se <- 25*sqrt(1/m+1/n)
z <- diff / se
qnorm(0.025)
#검정통계량(z) 값 -1.78이 임계값 -1.95보다 안쪽에 있으므로, 귀무가설 기각 못함

pval <- pnorm(z)*2
#(p-value)=0.07 > 0.025=(유의수준)이므로 귀무가설 기각하지 못함


### EXAMPLE4
x <- c(114, 96, 80, 102, 94, 94, 98, 92, 94, 100, 108, 110, 90, 90, 82, 106)
y <- c(108, 98, 88, 86, 100, 98, 104, 102, 94)
diff <- mean(x) - mean(y)
m <- length(x)
n <- length(y)
sp <- sqrt( ((m-1)*var(x) + (n-1)*var(y)) / (m+n-2) )
se <- sp*sqrt(1/m+1/n)
t <- diff / se
qt(0.025,m+n-2)
#검정통계량(t) 값 -0.18이 임계값 -2.06보다 안쪽에 있으므로, 귀무가설을 기각하지 못함

pval <- pt(t, m+n-2)*2
#(p-value) = 0.8541 > 0.025 =(유의수준)이므로, 귀무가설???) 을 기각하지 못함

t.test(x, y, var.equal=T)
#(p-value) = 0.8541 > 0.025 =(유의수준)이므로, 귀무가설???) 을 기각하지 못함


### EXAMPLE5
x <- c(200, 203, 201, 194 ,195, 202, 200, 199, 204, 199, 195, 196, 199, 200)
y <- c(204, 201, 196, 202, 205, 205, 197, 209, 197, 201, 187, 201, 192, 204, 203, 200, 207, 201, 213, 198, 198)
diff <- mean(x) - mean(y)
m <- length(x) 
n <- length(y)
wsdx <- var(x)/m 
wsdy <- var(y)/n
se <- sqrt(wsdx+wsdy)
df <- (wsdx+wsdy)^2  /  ( wsdx/(m-1)  +  wsdy/(n-1))
t <- diff / se
pval <- pt(t, df)*2
#(p-value)=0.2056 > 0.025 =(유의수준)이므로, 귀무가설을 기각하지 못함

t.test(x, y)
#(p-value)=0.2056 > 0.025 =(유의수준)이므로, 귀무가설을 기각하지 못함
