def contains_all_digits number, digits
  valid = true
  compare = number.to_s.split('').sort
  return compare == digits.sort
end

answer = nil
number_of_digits = 1
while answer.nil?
  max = ("1" + "6"*(number_of_digits-1)).to_i
  for n in (10**(number_of_digits-1))..max
    digits = n.to_s.split('')
    for a in 2..6
      break unless contains_all_digits(a*n, digits)
      answer = n if a == 6
    end
    break unless answer.nil?
  end
  number_of_digits += 1
end

puts answer
