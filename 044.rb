def pentagonal n
  return (n*(3*n - 1))/2
end

pentagonals = []
is_pentagonal = {}
min_difference = nil
upper_limit = 1000
lower_limit = 0

for n in lower_limit..upper_limit # calculate first 1000 pentagonals
  pentagonals << pentagonal(n)
end

while min_difference.nil? || (pentagonals[-1] - pentagonals[-2]) > min_difference
  for n in (upper_limit+1)..(upper_limit+1000) # calculate next 1000 pentagonals
    new_n = pentagonal(n)
    pentagonals << new_n
    is_pentagonal[new_n] = true
  end
  for j in 1..upper_limit
    for k in (j > lower_limit ? j+1 : lower_limit)..upper_limit
      next if j == k
      difference = pentagonals[k] - pentagonals[j]
      sum = pentagonals[k] + pentagonals[j]
      if is_pentagonal[difference] && is_pentagonal[sum]
        min_difference = difference if min_difference.nil? || difference < min_difference
      end
    end
  end
  lower_limit = upper_limit
  upper_limit += 1000
  puts upper_limit
end
puts min_difference
