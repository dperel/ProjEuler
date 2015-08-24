# Fizzbuzz.rb
1.upto(100) do |i|
  if i % 15 == 0
    p 'FizzBuzz'
  elsif i % 5 == 0 
    p 'Buzz'
  elsif i % 3 == 0
    p 'Fizz'
  else 
    p i 
  end
end

(1..100).each{|i| p fizzbuzz(i)}

#second solution 

def fizzbuzz(num)
  return 'Fizzbuzz' if num % 15 == 0
  return 'Fizz' if num % 5 == 0 
  return 'Buzz' if num % 3 == 0 
  num  
end

(1..100).each{|i| p fizzbuzz(i)}

#Could also do the above with case/when 

def fzbz(num)
  case 
    when num % 15 == 0 then 'Fizzbuzz'
    when num % 5 == 0 then 'Fizz'
    when num % 3 == 0 then 'Buzz'
    else num 
    end

  end

  fzbz(100)