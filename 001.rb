sum = 0
1..1000.times { |n| sum += n if n%5 == 0 || n%3 == 0 }
puts sum
