def fib n
  return 1 if n < 2
  return fib(n-1) + fib(n-2)
end
numbers,n,val = [],0,1
while(n<=4000000)
  n = fib(val)
  numbers << n if n%2 == 0
  val+=1
end
puts numbers.inject(:+)
