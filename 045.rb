def triangle n
  return (n*(n+1))/2
end
def pentagonal n
  return (n*(3*n-1))/2
end
def hexagonal n
  return n*(2*n-1)
end

is_pentagonal = {}
is_hexagonal = {}
Increment = 1000
lower_limit = 0
upper_limit = Increment

answer = 0
until answer > 40755
  for n in ((lower_limit*3/4)+1)..(upper_limit*3/4)
    is_pentagonal[pentagonal(n)] = true
  end
  for n in ((lower_limit*3/5)+1)..(upper_limit*3/5)
    is_hexagonal[hexagonal(n)] = true
  end
  for n in (lower_limit+1)..upper_limit
    test_n = triangle(n)
    if is_hexagonal[test_n] && is_pentagonal[test_n]
      answer = test_n
      break if answer > 40755
    end
  end
  lower_limit = upper_limit
  upper_limit += Increment
end
puts answer
