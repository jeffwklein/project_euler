def collatz_sequence_length number
  length = 1
  until number == 1
    if number%2 == 0
      number /= 2
    else
      number = (3*number) + 1
    end
    length += 1
  end
  return length
end

longest = 0
answer = 0
for i in 1..999999
  current = collatz_sequence_length i
  if current > longest
    longest = current
    answer = i
  end
end
puts answer
