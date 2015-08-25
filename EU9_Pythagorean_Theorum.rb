# There exists exactly one Pythagorean triplet for which a + b + c = 1000.
# Find the product abc.
# c = Math.sqrt(a**2 + b**2)


class Pythagorean

  def find_a_and_b(c)
    #iterate through values for A, stop when resulting B value is an integer. 
    ans = {}
    for a in (1..c)
      calc = Math.sqrt(c**2 - a**2)
      ans[a] = calc if calc == calc.to_i
      end
      p ans 
    end

end

tri = Pythagorean.new
tri.find_a_and_b(1000)

#This solution yields the following possible values: 
#{280=>960.0, 352=>936.0, 600=>800.0, 800=>600.0, 936=>352.0, 960=>280.0}
#which is more triples than the solution states is possible 
