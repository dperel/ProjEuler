# Starting with 1 and spiralling anticlockwise in the following way, a square spiral with side length 7 is formed.

# 37 36 35 34 33 32 31
# 38 17 16 15 14 13 30
# 39 18  5  4  3 12 29
# 40 19  6  1  2 11 28
# 41 20  7  8  9 10 27
# 42 21 22 23 24 25 26
# 43 44 45 46 47 48 49

# It is interesting to note that the odd squares lie along the bottom right diagonal, but what is more interesting is that 8 out of the 13 numbers lying along both diagonals are prime; that is, a ratio of 8/13 ≈ 62%.

# If one complete new layer is wrapped around the spiral above, a square spiral with side length 9 will be formed. If this process is continued, what is the side length of the square spiral for which the ratio of primes along both diagonals first falls below 10%?

class Spiral_Primes
@@ratio = 1
@@all_corners = []

#make an array of the squares of all odd numbers, which are the bottom right corners of the grid. The length of the array is the start number you provided as a test value.  
  def list_of_squares(limit)
    odd_squares = []
    (0..limit).each{|num| odd_squares << num*num if num%2!=0}
    n_rings = (odd_squares.length.to_i) - 1
    build_spiral_numbers(n_rings,odd_squares)
  end

#helper function to find primes 
  def is_prime?(num)
    return false if num<=1
    Math.sqrt(num).to_i.downto(2).each{|i| return false if num % i == 0}
    true 
  end

#build the concentric rings of the grid 
  def build_spiral_numbers(n_rings, odd_squares)
    ans_array = []
    for i in (0..n_rings) 
      if i == 0
        ans_array << odd_squares[i]
      else
        ans_array << Array((1+odd_squares[i-1])..odd_squares[i])
    end
  end
  prime_corners(ans_array)
end

#determine the corner values based on the primes at the lower right corners 
  def prime_corners(ans_array)
   ans_array.map{|arr| 
      if arr[0] != 1
        corner_a = arr[-1]
        edge = Math.sqrt(corner_a).to_i-1
        corner_b = corner_a - edge
        corner_c = corner_b - edge
        corner_d = corner_c - edge
        @@all_corners << [corner_a, corner_b, corner_c, corner_d]
      end
   }
   ratio_finder
   end

#last step: calculate the edge length of the spiral that pushes the total ratio of primes to not primes in the corners to <(1:10)
   def ratio_finder 
    num_primes = 0
    num_others = 0
    @@all_corners.each{|arr| 
      arr.each{|corner| 
        if is_prime?(corner) 
          num_primes+=1
        else
          num_others+=1
        end

        }
      }
    @@ratio = num_primes.to_f/num_others.to_f
    puts "The number of primes in a corner spot is " + num_primes.to_s
    puts "The number of non-primes in a corner spot is " + num_others.to_s
    puts "The ratio is " + @@ratio.to_s
    @@ratio 
   end 

   #run the problem
def run(start_number)     
   until @@ratio < 0.1
    list_of_squares(start_number)
    puts @@ratio
    start_number+=1000
   end 
   puts "The corner dimensions where the prime:non-prime ratio is <1:10 is "
   puts @@all_corners[-1]
 end 

end 


#Warning, this may take a long time. 
#The correct number is over 25,000, possibly far over 25,000. 
spiral = Spiral_Primes.new
spiral.run(100)