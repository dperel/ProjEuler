# HackerRank.com's coding-adapted verison of Project Euler 50 
# https://www.hackerrank.com/contests/projecteuler/challenges/euler050

# The prime 41, can be written as the sum of six consecutive primes: 
# 41=2+3+5+7+11+13
# This is the longest sum of consecutive primes that adds to a prime below one-hundred.

# The longest sum of consecutive primes below one-thousand that adds to a prime, contains 21 terms, and is equal to 953.

# Which prime, ≤N, can be written as the sum of the most consecutive primes? 


class EU50 

  def primes_array_maker(limit)
    primes = []
    num = 0
    1..limit.times do 
      primes << num if is_prime?(num)
      num +=1
    end
    make_sums(primes)
  end

  def is_prime?(num)
    return false if num <=1
    Math.sqrt(num).to_i.downto(2).each{|i| return false if num % i == 0}
    true 
  end

  def make_sums(primes)
    sums = []
    for y in 0..primes.length 
      sums << primes[y] if primes.include?(primes[0..y].inject{|sum, i| sum+=i }) 
    end
    filter_sums(sums)
    p sums
  end

  def run(input)
   primes_array_maker(input)
  end


end

#for n = 100000
euler = EU50.new
euler.run(100000)
#=> 
# [2, 3, 7, 13, 37, 43, 281, 311, 503, 541, 557, 593, 619, 673, 683, 733, 743, 839, 881, 929, 953, 1061]