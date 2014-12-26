def factorial n
  return 1 if n < 2
  return n * factorial(n-1)
end

def digit_fact_sum n
  return n.to_s.split('').inject(0){ |result,e| result + factorial(e.to_i) }
end

sum = 0
for n in 10..100000
  sum += n if n == digit_fact_sum(n)
end
puts sum
