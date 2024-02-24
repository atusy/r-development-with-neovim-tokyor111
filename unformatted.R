fizzbuzz <- function(x) {
	if (x %% 15) {
    return("FizzBuzz")
  }
          if (x %% 3) {
            return("Fizz")
          }
  if(x %% 5) {
    return("Buzz")
  }
  return(x)    
}
