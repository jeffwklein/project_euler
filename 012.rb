require './factors.rb'
n = 1
triangle = 0
while true
  triangle = (1..n).inject(:+)
  break if Factors.factors_of(triangle).size+2 > 500
  n += 1
end
puts triangle
