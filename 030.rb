fives = (0..9).map {|n| n**5}
answer = 0
for i in 10..999999
  digit_power_sum = i.to_s.split('').inject(0) { |r,d| r + fives[d.to_i] }
  answer += digit_power_sum if digit_power_sum == i
end
puts answer
