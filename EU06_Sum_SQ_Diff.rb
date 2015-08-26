# Find the difference between the sum of the squares of the first one hundred natural numbers and the square of the sum.


class SumDiff

  def sum_sq_diff(num)
    arr = Array (1..num)
    sum_of_squares = arr.inject{|sum, x| sum + x^2}
    sum = arr.inject{|sum,x| sum + x}
    diff = (sum**2) - sum_of_squares
    puts diff 
  end

end 

go = SumDiff.new
go.sum_sq_diff(100)

