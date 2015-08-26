

class LargestPrimeFinder 

##The aim of this method is to reduce the number provided
##as an argument into its prime factors 

def prime_array(num)
  factors = []
  divisor = 2 
  while num > 1
    while num % divisor == 0 
      factors << divisor
      num /= divisor 
    end  
  divisor +=1
  end 
  ##return the largest factor 
  factors.max 
end