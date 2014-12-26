# A set of utility functions that provide
# information about a given positive integer
# parameter, particularly relating to factors
# and divisibility.

module Factors
  # Returns true if a given positive integer is
  # prime, i.e. the only positive integers that
  # evenly divide it are 1 and itself.
  # Returns false otherwise.
  def self.is_prime? number
    return true if number == 2
    return false if number < 4
    for divisor in 2..(Math.sqrt(number).to_i)
      return false if number%divisor == 0
    end
    true
  end

  # Finds the proper factors of a positive
  # whole number. i.e. all whole numbers that
  # evenly divide n, excluding n and 1.
  # Returns an array of positive integers
  # sorted in descending order.
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

  # Finds all of the positive integers that
  # evenly divide a given positive integer n,
  # excluding n itself.
  # Returns an array of positive integers
  # sorted in descending order.
  def self.proper_divisors_of number
    factors_of(number) << 1
  end

  # Finds all of the positive integers that
  # evenly divide a given positive integer n,
  # INCLUDING n and 1.
  def self.divisors_of number
    [number] + factors_of(number) << 1
  end

  # Returns the prime factorization of a given
  # number as an array of numbers, sorted in
  # descending order.
  def self.prime_factorization_of number
    factors = factors_of(number)
    return [number] if factors.size == 0
    return prime_factors_of(factors.first) + [factors.last]
  end

  # Returns the unique prime factors of a given
  # number as an array of numbers, sorted in
  # descending order.
  def self.prime_factors_of number
    return prime_factorization_of(number).uniq
  end


end
