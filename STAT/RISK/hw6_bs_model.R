#######################################
### Assignment 6: Black Schores Model
#######################################

############################################################################################################################
# Input : Current stock price, strike price, eff.rate per time period, option(put/call), # of time steps
# output : option value(dataframe)
#############################################################################################################################
rm(list=ls())

BS_model=function(s_current,strike,sig,eff,N,T,type){
  ##### [1] Calculate the value
  ### 1: Q-measure 
  h = T/N
  u = exp(sig*sqrt(h))
  d = exp(-sig*sqrt(h))
  q = (exp(eff*h) - d)/(u-d)
  
  ### 2: Stock price & Build a stock price matrix
  s_mat = matrix(NA, nrow=N+1, ncol=N+1)
  
  for (i in 1:(N+1)) {
    for (j in 1:i) {
      s_mat[i,j] = s_current*u^(j-1)*d^(i-j)
    }
  }
  
  ### 3: Option price & Build a Option price matrix  
  o_mat = matrix(NA, nrow=nrow(s_mat), ncol=ncol(s_mat))
  if(type == 'put') {
    o_mat[nrow(o_mat),] = pmax(strike - s_mat[nrow(s_mat),], 0)
  } else if(type == 'call'){
    o_mat[nrow(o_mat),] = pmax(s_mat[nrow(s_mat),] - strike, 0)
  } else {cat('Error!')}
  for (i in (nrow(s_mat)-1):1) {
    for(j in 1:i) {
      o_mat[i, j] = (q*o_mat[i+1,j+1] + (1-q)*o_mat[i+1,j])/exp(eff*h)
    }
  }
  
  ##### [2] Output
  ### Option Price
  print(o_mat[1,1])
}


BS_model_limit=function(s_current,strike,sig,eff,T,type){
  ##### [1] Calculate the value
  d1=(log(s_current/strike)+(eff+sig^2/2)*T)/(sig*sqrt(T))
  d2=d1-sig*sqrt(T)
  
  if(type == 'put') {
    c0=strike*exp(-eff*T)*pnorm(-d2)-pnorm(-d1)*s_current
  } else if(type == 'call'){
    c0=pnorm(d1)*s_current-strike*exp(-eff*T)*pnorm(d2)
  } else {cat('Error!')}

  ##### [2] Output
  ### Option Price 
  print(c0)
}


######[3] TEST
s_current=100; strike=90; sig=0.15; eff=0.05; T=3;

#1_Put option
put1 = BS_model(s_current,strike,sig,eff,N=10,T,type='put')
put2 = BS_model(s_current,strike,sig,eff,N=100,T,type='put')
put3 = BS_model(s_current,strike,sig,eff,N=1000,T,type='put')
put4 = BS_model(s_current,strike,sig,eff,N=5000,T,type='put')
put_lim = BS_model_limit(s_current,strike,sig,eff,T,type='put')


#2_Call option
call1 = BS_model(s_current,strike,sig,eff,N=10,T,type='call')
call2 = BS_model(s_current,strike,sig,eff,N=100,T,type='call')
call3 = BS_model(s_current,strike,sig,eff,N=1000,T,type='call')
call4 = BS_model(s_current,strike,sig,eff,N=5000,T,type='call')
call_lim = BS_model_limit(s_current,strike,sig,eff,T,type='call')


###### [4] Making the dataframe
put=c(put1,put2,put3,put4,put_lim)
call=c(call1,call2,call3,call4,call_lim)
N_col=c(10,100,1000,5000,'lim')

df = data.frame(N_times=N_col, Put_option=put, Call_option=call)
df
