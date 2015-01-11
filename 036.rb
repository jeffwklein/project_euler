class String
  def is_palindrome?
    lower_index = 0
    higher_index = self.size - 1
    while lower_index < higher_index
      return false unless self[lower_index] == self[higher_index]
      lower_index += 1
      higher_index -= 1
    end
    return true
  end
end

answer = 0
for number in 1..1000000
  puts number if number%100000 == 0
  next unless number.to_s.is_palindrome?
  answer += number if number.to_s(2).is_palindrome?
end
puts answer
