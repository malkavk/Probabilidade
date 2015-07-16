set.seed(12345)
options(digits=5)

estML <- function(X){
  return( max(X))
}

estMom1 <- function(X){
  return( 2*mean(X))
}

n <- 3

vT <- c(1, 10) # Valores dos parâmetros
vA <- c(3, 5, 100) # Tamanho das amostras
vR <- 10^n    # População

vTetaML <- array(0,dim=c(length(vT),length(vA),vR))
vTetaMean <- array(0,dim=c(length(vT),length(vA),vR))

for( i in 1:length(vT)){
  vlT <- vT[i] 
  for(j in 1:length(vA)){
    vlA <- vA[j]  
    for(r in 1:vR){
      y <- runif(vlA,0,vlT)
      vTetaML[i,j,r] <- estML(y)
      vTetaMean[i,j,r] <- estMom1(y)
    }
  }
}
