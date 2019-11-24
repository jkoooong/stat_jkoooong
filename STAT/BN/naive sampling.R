#############################################################
############## HW6 EXAMPLE 7.1 NAIVE SAMPLING ###############
#############################################################


##install packages
#install.packages("BiocManager")
BiocManager::install("RBGL")
BiocManager::install("graph")
BiocManager::install("Rgraphviz")
if(!require('gRain')){install.packages('gRain');library(gRain)} else{library(gRain)}
if(!require('bnlearn')){install.packages('bnlearn');library(bnlearn)} else{library(bnlearn)}

library(RBGL)
library(graph)
library(Rgraphviz)
library(gRain)
library(gRbase)
library(bnlearn)

##levels of each node
a.level = c('young','adult','old')
s.level = c('M','F')
e.level = c('high','uni')
o.level = c('emp','self')
r.level = c('small','big')
t.level = c('car','train','other') 


##specify conditional probability tables
a <- cptable(~age, values=c(0.3,0.5,0.2),levels=a.level)
s <- cptable(~sex, values=c(0.6,0.4),levels=s.level)
e.as <- cptable(~education|age:sex,values=c(0.75,0.25,0.72,0.28,0.88,0.12,0.64,0.36,0.70,0.30,0.90,0.10),levels=e.level)
o.e <- cptable(~occupation|education,values=c(0.96,0.04,0.92,0.08),levels=o.level)
r.e <- cptable(~residence|education, values=c(0.25,0.75,0.2,0.8),levels=r.level)
t.or <- cptable(~travel|occupation:residence,values=c(0.48,0.42,0.10,0.56,0.36,0.08,0.58,0.24,0.18,0.70,0.21,0.09),levels=t.level)


##compile list of conditional probability tables and create the network
cpt.list <- compileCPT(list(a,s,e.as,o.e,r.e,t.or))
#build a network
dag <- grain(cpt.list)
#plot network
plot(dag)
#fit cpt table to network
#dag<-as.bn(dag)
#bn <- custom.fit(dag,cpt.list)


##Naive(forward) sampling
dag2 <- as.bn(dag)
dag2 <- as.graphNEL(dag2)
topo <- topo_sort(dag2) #topological ordering
n <- 1000 #number of particles
df = data.frame(age = rep(NA,n), sex = NA, education = NA, residence = NA, occupation=NA, travel=NA) #create data frame

for(i in 1:n){
  a = runif(1,0,1) #sample A from P(A)
  if(a <= cpt.list$age[1]){df$age[i] = a.level[1]} else if(a <= (cpt.list$age[1] + cpt.list$age[2])){df$age[i] = a.level[2]} else{df$age[i] = a.level[3]}
  s = runif(1,0,1) #sample S from P(S)
  if(s <= cpt.list$sex[1]){df$sex[i] = s.level[1]} else{df$sex[i] = s.level[2]}
  e = runif(1,0,1) #sample E from p(E|A,S)
  if(e <= querygrain(setFinding(dag,nodes=c('age','sex'),states=c(df$age[i],df$sex[i])))$education[1]){df$education[i] = e.level[1]} else{df$education[i] = e.level[2]}
  o = runif(1,0,1) #sample O from P(O|E)
  if(o <= querygrain(setFinding(dag,nodes='education',states=df$education[i]))$occupation[1]){df$occupation[i] = o.level[1]} else{df$occupation[i] = o.level[2]}
  r = runif(1,0,1) #sample R from P(R|E)
  if(r <= querygrain(setFinding(dag,nodes='education',states=df$education[i]))$residence[1]){df$residence[i] = r.level[1]} else{df$residence[i] = r.level[2]}
  t = runif(1,0,1) #sample T from P(T|O,R)
  if(t <= querygrain(setFinding(dag,nodes=c('occupation','residence'),states=c(df$occupation[i],df$residence[i])))$travel[1]){df$travel[i] = t.level[1]} else if(t <= (querygrain(setFinding(dag,nodes=c('occupation','residence'),states=c(df$occupation[i],df$residence[i])))$travel[1] + querygrain(setFinding(dag,nodes=c('occupation','residence'),states=c(df$occupation[i],df$residence[i])))$travel[2])){df$travel[i] = t.level[2]} else{df$travel[i] = t.level[3]}
}


###7.1(1)###
##approximate inference
#P(T=car)
sum(df$travel=='car')/1000
#P(T=train)
sum(df$travel=='train')/1000
#P(T=other)
sum(df$travel=='other')/1000

##true
querygrain(dag, nodes = "travel")$travel

###7.1(2)###
##approximate inference
#P(A=old,T=car|E=uni,R=big)
sum(df$age=='old' & df$education=='uni' & df$residence=='big' & df$travel=='car')/sum(df$education=='uni' & df$residence=='big')

##true
true.joint <- querygrain(setEvidence(dag,nodes=c('education','residence'),states=c('uni','big')), nodes=c('age','travel'), type="joint");true.joint

###7.1(3)###
##approximate inference
#P(A=old,T=car|E=uni,R=big)
sum(df$age=='old' & df$education=='uni' & df$residence=='big' & df$travel=='car')/sum(df$education=='uni' & df$residence=='big')
#P(A=old,T=train|E=uni,R=big)
sum(df$age=='old' & df$education=='uni' & df$residence=='big' & df$travel=='train')/sum(df$education=='uni' & df$residence=='big')
#P(A=old,T=other|E=uni,R=big)
sum(df$age=='old' & df$education=='uni' & df$residence=='big' & df$travel=='other')/sum(df$education=='uni' & df$residence=='big')
#P(A=adult,T=car|E=uni,R=big)
sum(df$age=='adult' & df$education=='uni' & df$residence=='big' & df$travel=='car')/sum(df$education=='uni' & df$residence=='big')
#P(A=adult,T=train|E=uni,R=big)
sum(df$age=='adult' & df$education=='uni' & df$residence=='big' & df$travel=='train')/sum(df$education=='uni' & df$residence=='big')
#P(A=adult,T=other|E=uni,R=big)
sum(df$age=='adult' & df$education=='uni' & df$residence=='big' & df$travel=='other')/sum(df$education=='uni' & df$residence=='big')
#P(A=young,T=car|E=uni,R=big)
sum(df$age=='young' & df$education=='uni' & df$residence=='big' & df$travel=='car')/sum(df$education=='uni' & df$residence=='big')
#P(A=young,T=train|E=uni,R=big)
sum(df$age=='young' & df$education=='uni' & df$residence=='big' & df$travel=='train')/sum(df$education=='uni' & df$residence=='big')
#P(A=young,T=other|E=uni,R=big)
sum(df$age=='young' & df$education=='uni' & df$residence=='big' & df$travel=='other')/sum(df$education=='uni' & df$residence=='big')

##true
true.joint <- querygrain(setEvidence(dag,nodes=c('education','residence'),states=c('uni','big')), nodes=c('age','travel'), type="joint");true.joint

###7.1(4)###
##approximate inference
#P(S=M|E=uni,R=big,T=car)
sum(df$sex=='M' & df$education=='uni' & df$residence=='big' & df$travel=='car')/sum(df$education=='uni' & df$residence=='big' & df$travel=='car')
#P(S=F|E=uni,R=big,T=car)
sum(df$sex=='F' & df$education=='uni' & df$residence=='big' & df$travel=='car')/sum(df$education=='uni' & df$residence=='big' & df$travel=='car')

##true
querygrain(setEvidence(dag,nodes=c('education','residence','travel'),states=c('uni','big','car')), nodes="sex")$sex
