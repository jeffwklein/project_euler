$fibonacci = {1=>1, 2=>1}
def fib n
  return $fibonacci[n] unless $fibonacci[n].nil?
  return 1 if n < 3
  $fibonacci[n] = fib(n-1) + fib(n-2)
end
number = 0; count = 0
while number.to_s.size < 1000
  count += 1
  number = fib count
end
puts count
