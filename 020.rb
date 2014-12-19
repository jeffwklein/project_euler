def factorial n
  return 1 if n < 2
  return n * factorial(n-1)
end
a = factorial 100
puts a.to_s.split('').inject(0) { |sum,d| sum + (d.to_i) }
