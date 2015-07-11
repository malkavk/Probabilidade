source('MontecarloEnsaioMultiParametrico.R')
library(HyperbolicDist)
library(nleqslv)
library(moments)

# Funcao que gera a amostra
rhyperb_mod = function(n, param){
 
  param1 = hyperbChangePars(2, 1, param)
  return(rhyperb(n, param1))
}

# Funcoes para a estimacao
## Por Maxima Verossimilhanca  
mv_hyp = function(x){
  # calcula a max. verossimilhanca em pi, zeta, delta, mu
  hyper.fit <- hyperbFit(x)
  
  # retorna os estimadores na parametrizacao alpha, beta, delta, mu
  return(hyperbChangePars(1, 2, hyper.fit$Theta))
}

## Por Momentos  
mom_hyp <- function(hypamostra){
  
  equacaoMomentos <- function(x) {
    y <- numeric(4)  
    
    y[1] = x[4]+(x[2]*x[3])/(sqrt(x[1]^2-x[2]^2))*RLambda(x[3]*sqrt(x[1]^2-x[2]^2)  ,1)-mean(hypamostra)
    
    
    y[2] = x[3]^2*((1/(x[3]*sqrt(x[1]^2-x[2]^2)))*
                RLambda(x[3]*sqrt(x[1]^2-x[2]^2)  ,1)+(x[2]^2/x[1]^2-x[2]^2)*
                SLambda(x[3]*sqrt(x[1]^2-x[2]^2)  ,1))-var(hypamostra)
    
    
    y[3] = (1/length(hypamostra))*sum(((x-(x[4]+(x[2]*x[3])/(sqrt(x[1]^2-x[2]^2))*
                RLambda(x[3]*sqrt(x[1]^2-x[2]^2)  ,1)))/(sqrt(x[3]^2*((1/x[3]*sqrt(x[1]^2-x[2]^2))*
                RLambda(x[3]*sqrt(x[1]^2-x[2]^2)  ,1 )+(x[2]^2/x[1]^2-x[2]^2)*
                SLambda(x[3]*sqrt(x[1]^2-x[2]^2)  ,1  )))))^3)-moments::skewness(hypamostra)
    
    
    y[4] = ((1/length(hypamostra))*sum(((x-(x[4]+(x[2]*x[3])/(sqrt(x[1]^2-x[2]^2))*
                RLambda(x[3]*sqrt(x[1]^2-x[2]^2)  ,1)))/(sqrt(x[3]^2*((1/x[3]*sqrt(x[1]^2-x[2]^2))*
                RLambda(x[3]*sqrt(x[1]^2-x[2]^2)  ,1 )+(x[2]^2/x[1]^2-x[2]^2)*SLambda(x[3]*sqrt(x[1]^2-x[2]^2)  ,1  )))))^4)-3)-moments::kurtosis(hypamostra)
    
    y
  } 
  
  chute.inicial <- hyperbFitStart(hypamostra) 
  chute.inicial <- chute.inicial$ThetaStart
  chute.inicial[2] <- exp(chute.inicial[2])
  chute.inicial[3] <- exp(chute.inicial[3])
  chute.inicial <- hyperbChangePars(1, 2, chute.inicial)
  chute.inicial[3] <- chute.inicial[3] * .5 #muda a proporcao entre as entradas inicias para que nao ocorra erro no cálculo
  chute.inicial[2] <- chute.inicial[2] * .3 #muda a proporcao entre as entradas inicias para que nao ocorra erro no cálculo
  names(chute.inicial) <- c('alpha', 'beta', 'delta', 'mu')
  
  Momentsnleqslv = nleqslv(chute.inicial, fn=equacaoMomentos, control=list(btol=.01), method = "Newton")
  return(Momentsnleqslv$x)
  
}


Theta = matrix(0, 3, 4)
Theta[1,] = c(2, 1, 2, 0)
Theta[2,] = c(3, 1, 1, 0)
Theta[3,] = c(3, 2, 1, 1)
  

dataMontecarloMV = EstPorMonteCarloMulti(fundist=rhyperb_mod, 
                                         est=c(mv_hyp),
                                         Theta, 
                                         R=1000,
                                         N=c(100, 1000, 10000), 
                                         bootstrap=F,                                         
                                         names=c('alpha', 'beta', 'delta', 'mu'))

dataMontecarloMomentos = EstPorMonteCarloMulti(fundist=rhyperb_mod, 
                                                  est=c(mom_hyp),
                                                  Theta, 
                                                  R=1000,
                                                  N=c(100, 1000, 10000), 
                                                  bootstrap=F, 
                                                  names=c('alpha', 'beta', 'delta', 'mu'))


  
