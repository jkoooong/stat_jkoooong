##### STATISTICAL RISK MANAGEMENT #####

#### LATEX ASSIGNMENT 2, SPRING, 2019

#### GROUP4 

### 1.GENERATING A SET OF RANDOM SAMPLES WITH N=100 UNDER NEG-BINOMIAL DIST'N

## WE SPECIFY THE CORRESPONDING PARAMETERS : 
## r(THE NUMBER OF SUCCESS)=1, 
## p(PROBABILITY OF SUCCESS)=0.3.
## FROM THE SETTING OF r=1, ONE CAN DEEM THIS DIST'N AS A CASE OF GEOMETRIC DIST'N; GEO(.3).
## STILL, IT IS IN THE BOUNDARY OF NEG-BIN FAMILY. IT IS JUST A SPECIAL CASE.

# THE rnbinom(.) FUNCTION WITH ARGUMENT (100,1,.3) WILL GENERATE RANDOM SAMPLE AS WE ASSUMED.

set.seed(2019312289) # FIX THE SEED NUMBER FOR POTENTIAL REPETITION.
random.sample <- rnbinom(100,1,.3)
random.sample # See the random sample

# THE PLOT OF LIKELIHOOD & LOG-LIKELIHOOD FUNCTION
n <- 100 # sample size
sum <- sum(random.sample) # the sum of the sample values
x <- seq(from=0,to=1,by=.01)
y <- (x^n)*((1-x)^sum)
par(mfrow=c(2,1))
plot(y~x,type='l', main='likelihood function',xlab='parameter',ylab='likelihood')
plot(log(y)~x,type='l',main='log-likelihood function',xlab='parameter',ylab='log-likelihood')

## MAXIMIZATION OF THE LIKELIHOOD FUNCTION
# BY THE EXTREME VALUE THEOREM,
# THE MAXIMIZER IS DEFINED AS THE SOLUTION OF DIFFERENTIAL EQUATION,
# IN WHICH THE MAXIMIZER MAKES THE FIRST DERIVATIVE ZERO.
# HERE, THE SECOND DERIVATIVE TEST IS OMITTED.
# DETOURING THE ANALYTIC APPROACH, WE WILL FIND THE SOLUNTION NUMERICALLY.

# FIRST DERIVATIVE
diff.log.L <- function(p,N,Sum){
res <- N/p-(Sum/(1-p))
return(res)
}

# SECOND DERIVATIVE
twice.diff.log.L <- function(p,N,Sum){
res <- -N/(p^2)-(Sum/((1-p)^2))
return(res)
}

## HERE, THE NEWTON-RAPHSON METHOD IS APPLIED.
theta=0.5 # INITIAL VALUE
i=0 # INDEX FOR THE NUMBER OF ITERATION
repeat{
i=i+1
theta1=theta-(diff.log.L(theta,n,sum)/twice.diff.log.L(theta,n,sum))
if(abs(theta1-theta)<10^(-5)) break
theta=theta1
}
theta1;i
n/(n+sum) # ANALYTIC SOLUTION FRO MLE OF NB(1,P)
# NOTE THAT WE CAN FIND THAT OUR NUMERICAL MAXIMIZER IS COINCIDENT WITH THE ANALYTIC MLE.

## CONFIDENCE INTERVAL
# REPEATING SAMPLING, ONE CAN MAKE A SIMULATION FOR CONFIDENCE INTERVAL
# HERE, THE ASYMPTOTIC DISTRIBUTION OF MLE MAKE IT FEASIBLE TO GET 95% CONFIDENCE INTERVAL
# FOR EACH SET OF RANDOM SAMPLE, 
# DETOURING FIGURING OUT THE EXACT SAMPLING DISTRIBUTION

# NOTE THAT ONE-SAMPLE FISHER INFO'N OF p IS EQUAL TO 1/((p^2)(1-p))
# WE WILL USE THE OBSERVED FISHER INFO'N 
# TO AVOID THE SITUATION WHERE THE PARAMETER OF INTEREST IS USED TO INFER VERY THAT PARAMETER,
# WHICH IS ABSURD.

# FOR CONVENIENCE, GENERATE THE SMAPLE MATRIX,
# WHOSE COLUMN VECTOR REPRESENTS A TUPLE OF RANDOM SAMPLE OF SIZE 100.

sample.matrix<-matrix(0,ncol=100,nrow=100)
sample.matrix[,1] <- random.sample
for(i in 2:ncol(sample.matrix)){
sample.matrix[,i] <- rnbinom(100,1,.3)
}

x11()
plot(x=c(-.1,1.1),y=c(0,10.1),type='n',
     main='Simulation for Confidence Interval',
     xlab='p',ylab='')
frequency <- 0
Sums <- colSums(sample.matrix)
n <- nrow(sample.matrix)
z <- qnorm(0.975)
for(i in 1:ncol(sample.matrix)){
mle <- n/(n+Sums[i])
L <- mle-z*sqrt((mle^2)*(1-mle)/n) ; U <- mle+z*sqrt((mle^2)*(1-mle)/n)
L.t <- ifelse(L<0.3,1,0)
U.t <- ifelse(U>0.3,1,0)
if(L.t*U.t==1){
lines(c(L,U),rep(10.1-.1*i,2),lty=1)
}else{
lines(c(L,U),rep(10.1-.1*i,2),lty=1,col='red')
}
frequency <- frequency+(L.t*U.t)
}
frequency # Numer of C.I's which contains the parameter of interest
abline(v=.3,col='blue')
legend('topright',lty=1,col=1:2,legend=c('Spot on : 96','Miss : 4'))
## FROM THE EMPIRICAL STUDY, WE CAN FIGURE OUT THE MEANING OF CONFIDENCE INTERVAL.
## : THE 95% CONFIDENCE LEVEL MEANS THAT
## THE 0.95N CONFIDENCE INTERVALS CONTAINS THE TRUE PARAMETER OUT OF N SETS OF RANDOM SAMPLE.


