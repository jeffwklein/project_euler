require './prime.rb'
primes = [2]
is_prime = {}
c = 1
while primes.size < 21
  c += 2
  is_prime[c] = c.prime?
  primes << c if is_prime[c]
end
while primes[-21..-1].inject(:+) < 1000000
  c += 2
  is_prime[c] = c.prime?
  primes << c if is_prime[c]
end
consecutive = 21
answer = 0
until primes[0..consecutive-1].inject(:+) > 1000000
  sum = primes[0..consecutive-1].inject(:+)
  for i in 0..(primes.size-consecutive)
    break if sum > 1000000
    is_prime[sum] = sum.prime? if is_prime[sum].nil?
    if is_prime[sum] 
      answer = sum
      break
    end
    sum -= primes[i]
    sum += primes[i+consecutive] unless primes[i+consecutive].nil?
  end
  consecutive += 1
end
puts answer
