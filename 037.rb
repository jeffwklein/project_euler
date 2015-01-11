require './factors.rb'

$prime = {}
def truncatable number, operation
  digits = number.to_s.split('')
  digits.each do |digit|
    digit = digit.to_i
    return false if digit != 2 && digit%2 == 0
  end
  until digits == []
    new_n = digits.join.to_i
    prime_status = $prime[new_n]
    if prime_status.nil?
      prime_status = Factors.is_prime? new_n
      $prime[new_n] = prime_status
    end
    if prime_status
      digits.send(operation)
    else
      return false
    end
  end
  return true
end

truncatable_primes = []
for i in 11..1000000
  if truncatable(i,:pop)
    if truncatable(i,:shift)
      truncatable_primes << i
    end
  end
end
puts truncatable_primes.inject(:+)
