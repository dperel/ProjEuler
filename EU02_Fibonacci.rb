#recursive Fibonacci answer 
def fib(n)
  #base case 
  return 1 if n<=2
  #more complex cases 
  fib_index = 3 
  a, b = 1, 1
  #the loop increments the index each time it runs
  #so you can control how many fib numbers you return
  while fib_index <=n
    #This loop accumulates the numbers in fibonacci 
    #C is the sum of the first two fibs
    #B is then set to C
    #which is added to the second of the first two fibs
    #and then a is set to the second trailing fib again
    #while b is set to the most recent fib
    #then they are added together to produce the next fib
    c = a+b
    a = b
    b = c
    fib_index+=1
  end
  #print out highest fib reached given the input  
  c
 end

#input the first 100 index numbers of fibonacci 

p (1..100).map {|i| fib(i)}

