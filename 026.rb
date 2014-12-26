def cycle_length n
  dividend = 1000 if n <= 1000
  dividend = 100 if n <= 100
  dividend = 10 if n <= 10
  dividends = []
  cycle = 0
  while cycle == 0
    dividend = (dividend % n) * 10
    return 0 if dividend == 0
    cycle = check_cycle(dividends, dividend)
    dividends << dividend
  end
  return cycle
end

def check_cycle dividends, dividend
  if dividends.include? dividend
    return dividends.size - dividends.index(dividend)
  else
    return 0
  end
end

largest_cycle = 0; d = 0
for i in 1..1000
  c = cycle_length(i)
  if c > largest_cycle
    largest_cycle = c 
    d = i
  end
end

puts d
