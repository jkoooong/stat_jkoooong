rm(list=ls())

glass <- read.csv("C:/Users/user/Desktop/multivariate/glass.csv") 

library(ggplot2) 

##########LDA
library(MASS)
library(gridExtra)
lda.fit<-lda(Type~.,data = glass)
lda.fit
lda.fit$counts
lda.fit$svd

DT.lda<-as.matrix(subset(glass, select = c(-Type)))
DT.lda<- DT.lda %*% lda.fit$scaling
DF.lda<-data.frame(DT.lda,glass$Type)
names(DF.lda)<-c( "LD1","LD2","LD3","LD4","LD5","Type")
ggplot(data=DF.lda, aes(x=LD1,y=LD2,colour=as.factor(Type)))+geom_point()+ggtitle('Separation by Linear Discriminants')

glda1<-ggplot(data=DF.lda, aes(x=LD1,fill=as.factor(Type)))+geom_density(alpha=0.25)
glda2<-ggplot(data=DF.lda, aes(x=LD2,fill=as.factor(Type)))+geom_density(alpha=0.25)
glda3<-ggplot(data=DF.lda, aes(x=LD3,fill=as.factor(Type)))+geom_density(alpha=0.25) 
glda4<-ggplot(data=DF.lda, aes(x=LD4,fill=as.factor(Type)))+geom_density(alpha=0.25)
glda5<-ggplot(data=DF.lda, aes(x=LD5,fill=as.factor(Type)))+geom_density(alpha=0.25)

grid.arrange(glda1,glda2,glda3,glda4,glda5,ncol=2,top='Class Separation by Linear Discriminants')
