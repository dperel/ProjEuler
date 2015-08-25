# The sum of the primes below 10 is 2 + 3 + 5 + 7 = 17.

# Find the sum of all the primes below two million.

class Summation 

    def sum_primes(limit)
    primes = []
    num = 1
    begin 
      d, count = 2, 0
      while d <= Math.sqrt(num) && count == 0
      #To improve efficiency, testing a number for primeness ends when its first factor is found. 
        count+=1 if num % d ==0
        d+=1
      end
      primes << num if count == 0 
      num+=1    
    end until num == limit
    puts primes.inject{|sum, x| sum+ x}
    end


end

summup = Summation.new
summup.sum_primes(2000)
