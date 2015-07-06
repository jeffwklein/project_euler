answer = 0
for a in 1..99
  for b in 1..99
    digit_sum = (a**b).to_s.split('').inject(0){|res,d| res + d.ord-48}
    answer = digit_sum if digit_sum > answer
  end
end
puts answer
