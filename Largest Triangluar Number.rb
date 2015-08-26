# Largest Triangluar Number - https://projecteuler.net/problem=12

class Triangular 

  def find_triangular(num_of_divisors)
    #use Kernel method to make an array of the numbers up to the desired limit
    nums = Array (1..num_of_divisors)
    ans = nums.inject{|sum, x| sum + x}
    p ans 
  end

end

euler = Triangular.new
euler.find_triangular(500)