####################################
# Assignment 3: Financing calculator
####################################

####################################################################
# Input : Loan amt, # of payments, comp. info., APR, repayment type 
# output : All relevent quantities
#####################################################################

financing_calculator <- function(){
  cat('Input your loan amount:')
  loan_amount = readline()
  loan_amount = as.numeric(loan_amount)
  
  cat('Input the number of payments:')   #number of payments
  n = readline()
  n = as.numeric(n)
  
  cat('Choose your compounding information (e.g. 1):
   1. Monthly   2. Quarterly   3. Semi-annually   4. Annually\n')
  comp_info = readline()
  
  if(comp_info == 1){
    m = 12
    comp = 'monthly'
  }else if (comp_info == 2){
    m = 4
    comp = 'quarterly'
  }else if (comp_info == 3){
    m = 2
    comp = 'semi-annually'
  }else if (comp_info == 4){
    m = 1 
    comp = 'annually'
  }else
  {cat('Error!')}
  
  cat('Input your APR informaion:\n')
  apr = readline()
  apr = as.numeric(apr)
  
  cat('Choose your repayment type (e.g. 2):
   1. Each payment is level payment. 
   2. Each payment include: accrued interest and equal installment of principal.
   3. Each payment interest only.(Last payment is the sum of the last interest and principal)\n')
  model_class = readline()
  
  if(model_class == 1)
    model_1(loan_amount, n, m, comp,apr)
  else if (model_class == 2)
    model_2(loan_amount, n, m, comp, apr)
  else if (model_class == 3)
    model_3(loan_amount, n, m, comp, apr)
  else
  {cat('Error!')}
}


#################
##### model #####
#################

model_1 <- function(loan_amount, n, m, comp, apr){
  r = apr/(m*100)
  c = loan_amount/((1-(1+r)^(-n))/(r))
  
  cat('Your',comp,'payment is $',c,'for',n,'times.','\n')
}

model_2 <- function(loan_amount, n,m,comp,apr){
  options("scipen"=100, "digits"=4)
  r=apr/(m*100)
  portion <- rep(loan_amount/n,n) # part of principal at each paym't
  commission <- rep(0,n) # interest at each paym't
  for(i in 1:n){
    commission[i] = (n+1-i)*loan_amount*r/n
  }
  remain=seq(from=loan_amount*(n-1)/n,to=0,length=n)
  Table <- data.frame(total_payment=portion+commission, principal=portion,
                      interest=commission, remain=remain)
  cat('\n','Repayment Plan under i(',m,')=',apr,'%','\n',sep='')
  cat('Repayment Type: accured interest','\n')
  cat('Principal: $',loan_amount,'\n')
  cat('# of CF: ',n,'\n')
  cat('\nSee details as followings:\n')
  return(Table)
}


model_3 <- function(loan_amount, n, m, comp, apr){
  options("digits"=4)
  r = apr/(m*100)
  
  interest_payment = loan_amount*r
  last_payment = interest_payment+loan_amount
  
  loan = rep(0,n)
  remain=rep(loan_amount,n)
  for(i in n){
    if(i==n){
      loan[i] = loan_amount
      remain[i] = 0
    }
  }
  
  Table = data.frame(total_payment=interest_payment+loan, principal=loan,
                     interest=interest_payment, remain=remain)
  
  cat('Your',comp,'payment is $', interest_payment,'for',n-1,'times.\n')
  cat('And the Last payment is $', last_payment,'\n')
  cat('\nSee details as followings:\n')
  return(Table)
}


###################
##### example #####
###################

financing_calculator()
38625
72
1
4.27
3

financing_calculator()
1200000
6
1
12.90
2

financing_calculator()
60000
11
4
5.5
1


