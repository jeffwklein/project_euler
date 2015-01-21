answer = 0
last_row = [1,1]
for r in 2..100
  new_row = [1]
  for n in 0..(last_row.size-2)
    new_term = (last_row[n] + last_row[n+1])
    answer += 1 if new_term > 1000000
    new_row << new_term
  end
  new_row << 1
  last_row = new_row
end
puts answer
