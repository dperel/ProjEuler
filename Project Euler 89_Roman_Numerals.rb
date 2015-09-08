# Project Euler 89: Roman Numerals

# Strategy: 
# Find the sum total of the number
# Put the sum total into an algorithm that returns the most efficient roman numeral 

require 'pry'

class String
  def rom_to_i
      if self == "I" 
       1
  elsif self == "V"
       5
  elsif self == "X"
       10
  elsif self == "L"
       50
  elsif self == "C"
       100
  elsif self == "D"
      500
  elsif self == "M"
       1000
  end 
   
end

end 

class RomanNumeral 

def run(given_numeral)
  count = 0 
  given_numeral.split("").map{|letter| count += (letter.rom_to_i)}
  val_to_numeral(count)
end 

def val_to_numeral(count)
  m = (count / 1000).to_i
  count -= m*1000
  puts "M"* m
  d = (count / 500).to_i
  count -= d*500 
  puts "D"*d 
  c = (count / 100).to_i
  count -= c*100
  puts "C"*c
  l = (count / 50).to_i
  count-= l*50
  puts "L"*l
  x = (count / 10).to_i 
  count -= x*10
  puts "X"*x
  v = (count / 5).to_i
  count-= v*5
  puts "V"*v
  i = count
  puts "I"*i

  puts "Compacted Value is " + ("M"* m) + ("D"*d) + ("C"*c) + ("L"*l) + ("X"*x) + ("V"*v) + ("I"*i)
end 
end



rome = RomanNumeral.new 
rome.run("MCLVVVVIII")
