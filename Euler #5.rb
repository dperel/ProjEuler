# Euler #5

# 2520 is the smallest number that can be divided by each of the numbers from 1 to 10 without any remainder.

# What is the smallest positive number that is evenly divisible by all of the numbers from 1 to 20?


class SmallMultiple

@@divisor_array = Array (1..20)
  def multiples(num)
    begin  
    count = 0 
      @@divisor_array.each{|n| count+=1 if num % n == 0}
      num+=1 
    end until count == 19
    puts num-1 
    #subtract 1 to compensate for the incrementation of n after each round 
    end
end

large_calculation = SmallMultiple.new

#I do not advise starting at 1 as shown below
#It may take a very long time to run the calculations
#For example, a number that is a multiple of 19 of ints 1-20 is 12,252,240

large_calculation.multiples(1)


