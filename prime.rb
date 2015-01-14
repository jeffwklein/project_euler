class Fixnum
  def prime?
    return true if self == 2
    return false if self < 3
    for divisor in 2..(Math.sqrt(self).to_i)
      return false if self%divisor == 0
    end
    true
  end
  # Returns true if a given positive integer is
  # prime, i.e. the only positive integers that
  # evenly divide it are 1 and itself.
  # Returns false otherwise.
  def is_prime?
    return true if self == 2
    return false if self < 3
    for divisor in 2..(Math.sqrt(self).to_i)
      return false if self%divisor == 0
    end
    true
  end

  # Finds the proper factors of a positive
  # whole number. i.e. all whole numbers that
  # evenly divide n, excluding n and 1.
  # Returns an array of positive integers
  # sorted in descending order.
  def factors
    factors = []
    for divisor in 2..(Math.sqrt(self).to_i)
      if self%divisor == 0
        factors << divisor 
        factors << (self/divisor)
      end
    end
    return factors.sort!.reverse!
  end

  # Finds all of the positive integers that
  # evenly divide a given positive integer n,
  # excluding n itself.
  # Returns an array of positive integers
  # sorted in descending order.
  def proper_divisors
    self.factors << 1
  end

  # Finds all of the positive integers that
  # evenly divide a given positive integer n,
  # INCLUDING n and 1.
  def divisors
    [self] + self.factors << 1
  end

  # Returns the prime factorization of a given
  # number as an array of numbers, sorted in
  # descending order.
  def prime_factorization
    factors_list = self.factors
    return [self] if factors.size == 0
    return factors_list.first.prime_factorization + [factors_list.last]
  end

  # Returns the unique prime factors of a given
  # number as an array of numbers, sorted in
  # descending order.
  def prime_factors
    return self.prime_factorization.uniq
  end

end
