require './prime.rb'

primes = []
n = 1
answer = nil
until answer
  n += 2
  if n.prime?
    primes << n
    next
  end
  valid = false
  primes.each do |p|
    for s in 1..n
      sum = p + 2*s**2
      break if sum > n
      if sum == n
        valid = true
        break
      end
    end
    break if valid
  end
  answer = n unless valid
end
puts answer
