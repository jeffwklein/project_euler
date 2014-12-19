require './factors.rb'
sum = 0
for number in 2..2000000
  sum += number if Factors.is_prime? number
end
puts sum
