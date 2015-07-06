class Bignum
  def is_palindrome?
    self.to_s == self.to_s.reverse
  end
  def reverse_add
    self + self.to_s.reverse.to_i
  end
end
class Fixnum
  def is_palindrome?
    self.to_s == self.to_s.reverse
  end
  def reverse_add
    self + self.to_s.reverse.to_i
  end
  def is_lychrel?
    n = self
    for i in 1..50
      n = n.reverse_add
      return false if n.is_palindrome?
    end
    return true
  end
end
answer = 0
for number in 1..9999
  answer += 1 if number.is_lychrel?
end
puts answer
