#By listing the first six prime numbers: 2, 3, 5, 7, 11, and 13, we can see that the 6th prime is 13.

#What is the 10 001st prime number?

class PrimeFinder

  def find_prime(num)
    primes = []
    begin 
      d, count = 2, 0
      while d <= Math.sqrt(num) && count == 0
      #To improve efficiency, testing a number for primeness ends when its first factor is found. 
        count+=1 if num % d ==0
        d+=1
      end
      primes << num if count == 0 
      num+=1    
    end until primes.length == 10
    puts primes
  end
end

prm = PrimeFinder.new
prm.find_prime(10001)
