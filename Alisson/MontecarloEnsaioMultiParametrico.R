library(boa)

criarDataFrameMultiParam <- function(names=c(), bootstrap=F, theta.len ,Theta.len,N.len, est.len){
  
  N = length(names)
  
  for(n in 1:N) names = c(names, paste(names[n], ".hat", sep="")
  }
  
  for(n in 1:N) names = c(names, paste(names[n], ".hat.bias", sep=""))
  
  for(n in 1:N) names = c(names, paste(names[n], ".hat.eqm", sep=""))   
  
  if(bootstrap == T){
    for(n in 1:N) names = c(names, paste(names[n], ".til", sep=""))
    
    for(n in 1:N) names = c(names, paste(names[n], ".til.bias", sep=""))
    
    for(n in 1:N) names = c(names, paste(names[n], ".til.eqm", sep=""))
  }
  
  names = c(c('Amostra', 'Estim'), names)
  
  out <- matrix(0, Theta.len * N.len * est.len, length(names))
  colnames(out) <- names
  
  return(as.data.frame(out))
}

boot <- function(x.hat, x, R, fun){
  x.boot <- matrix(0, R, length(x.hat))
  for(r in 1:R){
    samp.boot = sample(x, replace=TRUE)
    x.boot[r,] = fun(samp.boot)    
  }
  return( 2*x.hat - colMeans(x.boot))
}

EstPorMonteCarloMulti = function(fundist, est, Theta, N=1, R=100, bootstrap=FALSE, Rb=100, names=c()) {
  
  Theta.len = dim(Theta)[1]
  N.len = length(N)
  est.len = length(est)
  
  x.hat = x.til = matrix(0, R, dim(Theta)[2])
  
  data = criarDataFrameMultiParam(names, theta.len=dim(Theta)[2] ,Theta.len=Theta.len,N.len=N.len, est.len=est.len)
  
  index = 1
  
  for (i_t in 1:Theta.len){
    # t é um vetor
    t = Theta[i_t,]
    
    for (i_n in 1:N.len){
      n = N[i_n]
      
      for(e in 1:est.len){
  
        fun = est[[e]]
        for(r in 1:R){
         
          runner = function(fun, n, t){
            x = fundist(n, t)
            return(fun(x)) # Estimador do parametro
          }
          
          x.hat[r,] = try(runner(fun,n, t))
          
          if(bootstrap == TRUE){
            x.til[r,] = boot(x.hat[r,], x, Rb, fun) # Usa-se o mesmo estimador do parametro
          }
        }
        hat = rep(0,dim(Theta)[2])
        hat = try(colMeans(x.hat))
        bias.hat = hat - t
        
        eqm.hat = bias.hat^2 + colVars(x.hat)
        
        
        if(bootstrap == TRUE){
          bias.til = colMeans(x.til) - t
          eqm.til = (bias.til)^2 + colVars(x.til)
          
          data[ index , ] = c(t, n, e, bias.hat, eqm.hat, bias.til, eqm.til)
        }else{
          data[ index , ] = c(n, e, t, hat, bias.hat,eqm.hat)          
        }
        cat(index, '\n')
        index = index + 1
        
      }
      
    }
    
  }
  return(data)
}
