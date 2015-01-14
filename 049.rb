require './prime.rb'
def is_permutation x, y
  return x.to_s.split('').sort == y.to_s.split('').sort
end
for a in 1000..9997
  next unless a.prime?
  limit = ((10000 - a)/2) - 1
  n = 0
  while n <= limit
    n += 1
    t2 = a+n
    next unless t2.prime?
    next unless is_permutation(a, t2)
    t3 = t2+n
    next unless t3.prime?
    next unless is_permutation(t2, t3)
    if a > 1487
      puts a.to_s + t2.to_s + t3.to_s
      exit
    end
  end
end
