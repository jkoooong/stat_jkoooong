#######################################
### Assignment 5: European option in R
#######################################

############################################################################################################################
# Input : Current stock price, strike price, %(up/down), eff.rate per time period, option(put/call), # of time steps(max:5)
# output : all Input informtaion, stock value, option value
#############################################################################################################################
rm(list=ls())

European_option <- function(){
  
  ##### [1] Input the Value
  ### 1: Current stock price
  cat('Input the Current stock price :')
  s_current = readline()
  s_current = as.numeric(s_current)
  
  ### 2: Strike price
  cat('Input the strike price:')
  strike = readline()
  strike = as.numeric(strike)
  
  ### 3: Changing percent of the Stock price (up/down)
  cat('Input the Change percent of the Stock price :')
  per = readline()
  per = as.numeric(per)
  
  ### 4: Effective rate per time period
  cat("Input the effective rate per time period")
  eff = readline()
  eff = as.numeric(eff)
  
  ### 5: Number of time steps  
  cat('Input the number of time steps:\n')
  N = readline()
  N = as.numeric(N)
  
  ### 6: Option type  
  cat('Choose your option type (e.g. 2):
      1. Put option     2. Call option\n')
  type = readline()
  type = as.numeric(type)
  
  
  ##### [2] Calculate the value
  ### 1: Q-measure 
  su=s_current*(1+per/100)
  sd=s_current*(1-per/100)
  q=(s_current*(1+eff/100)-sd)/(su-sd)
  
  ### 2: Stock price & Build a stock price matrix
  s_mat = matrix(NA, nrow=N+1, ncol=N+1)
  u = 1+per/100
  d = 1-per/100
  
  for (i in 1:(N+1)) {
    for (j in 1:i) {
      s_mat[i,j] = s_current * u^(j-1) * d^(i-j)
    }
  }
  
  ### 3: Option price & Build a Option price matrix  
  o_mat = matrix(NA, nrow=nrow(s_mat), ncol=ncol(s_mat))
  if(type == 1) {
    type = 'Put option'
    o_mat[nrow(o_mat),] = pmax(strike - s_mat[nrow(s_mat),], 0)
  } else if(type == 2){
    type = 'Call option'
    o_mat[nrow(o_mat),] = pmax(s_mat[nrow(s_mat),] - strike, 0)
  } else {cat('Error!')}
  for (i in (nrow(s_mat)-1):1) {
    for(j in 1:i) {
      o_mat[i, j] = ((1-q)*o_mat[i+1,j] + q*o_mat[i+1,j+1])/(1+eff/100)
    }
  }
  
  ##### [3] Output
  ### 1: All of input information
  cat(' Current Stock price :', s_current,'\n')
  cat('\n Strike price :', strike,'\n')
  cat('\n The Change percent of the Stock price  :', per,'%\n')
  cat('\n Effective rate per time period  :', eff,'%\n')
  cat('\n The number of time steps:', N,'period \n')
  cat('\n Option type:', type,'\n')
  
  ### 2: Stock Price Matrix
  cat('\n Stock Price Matrix: \n')
  print(s_mat, na.print = "")

  ### 3: Option Price Matrix
  cat('\n Option Price Matrix: \n')
  print(o_mat, na.print = "")
}

##### [4] Testing: EXAMPLE OF THREE PERIOD BOPM
European_option()
25
25
15
5
3
2

