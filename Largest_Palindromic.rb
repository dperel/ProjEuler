# A palindromic number reads the same both ways. The largest palindrome made from the product of two 2-digit numbers is 9009 = 91 × 99.

# Find the largest palindrome made from the product of two 3-digit numbers.

#This is an object-oriented brute force solution that has a big O complexity of n^2

class Palindromic 


  def incrementer(num)
    @@palindromes = {}
    num.downto(1) do |i|
      num.downto(1) do |j|
          Palindromic.checker(i,j)
        end
      end
      p @@palindromes.max
  end


  def self.checker(num1, num2)
      numbers = (num1*num2).to_s.split("")
      if numbers[0..numbers.length/2] == numbers[numbers.length/2..numbers.length].reverse 
        @@palindromes[num1*num2] = [num1,num2]
        #stores palindromes in a hash. 
        #The palindrome is the key, the factors are the values 

      else 
        puts "Not palindromic"
        #this step is not necessary, but it does display info to the console
      
      end
  end 
end


find_palindrome = Palindromic.new 
find_palindrome.incrementer(999)