require './prime.rb'

consecutive = 0
n = 647
until consecutive == 4
  if n.prime_factors.size == 4
    consecutive += 1
  else
    consecutive = 0
  end
  n += 1
end
puts n-4
