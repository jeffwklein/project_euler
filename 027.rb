require './factors.rb'
max_consecutive = 0
product = 0
for a in -999..999
  for b in -999..999
    consecutive_primes = 0; n = 0
    while Factors.is_prime?(n**2 + a*n + b)
      consecutive_primes += 1 
      n += 1
    end
    if consecutive_primes > max_consecutive
      max_consecutive = consecutive_primes
      product = a*b
    end
  end
end
puts product
