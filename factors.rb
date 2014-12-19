module Factors

  def self.is_prime? number
    return true if number < 4
    for divisor in 2..(Math.sqrt(number).to_i)
      return false if number%divisor == 0
    end
    true
  end

  def self.factors_of number
    factors = []
    for divisor in 2..(Math.sqrt(number).to_i)
      if number%divisor == 0
        factors << divisor 
        factors << (number/divisor)
      end
    end
    return factors.sort!.reverse!
  end

  def self.prime_factors_of number
    factors = factors_of number
    prime_factors = []
    factors.each do |f|
      if is_prime? f
        prime_factors << f
      else
        prime_factors += prime_factors_of f
      end
    end
    return prime_factors.sort!.reverse!
  end

end
