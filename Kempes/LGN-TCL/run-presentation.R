library(rmarkdown)
library(shiny)
filename<-paste(trimws(dirname(sys.frame(1)$ofile)),"/aula-LGN-TCL.Rmd",sep="")
rmarkdown::run(filename)
