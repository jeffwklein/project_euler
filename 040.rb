str = "."
int = 1
until str.size > 1000000
  str += int.to_s
  int += 1
end
answer = 1
for i in 0..6
  answer *= str[10**i].to_i
end
puts answer
