N <- 1000
counter <- 0
for(i in rnorm(N)){
  if(i > -1  & i < 1 ){
    counter <- counter + 1
  }
}
answer <- counter / N
answer

#compare to 68.2% or 0.682