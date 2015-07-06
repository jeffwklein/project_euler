def num_digits n
  return n.to_s.size
end
power = 1
number = 1
answer = 0
change = 0
while true
  digits = num_digits(number**power)
  answer += 1 if digits == power
  change += 1 if digits == power
  puts answer if answer % 100 == 0
  if digits > power
    if change == 0
      puts answer
      exit
    end
    change = 0
    power += 1
    number = 1
  else
    number += 1
  end
end
