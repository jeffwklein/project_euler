require './prime.rb'

total = 13
primes = 8
side_length = 7

while (primes.to_f/total) > 0.1
  side_length += 2
  count = side_length**2
  primes += 1 if count.prime?
  3.times do
    count -= (side_length - 1)
    primes += 1 if count.prime?
  end
  total += 4
end

puts side_length
