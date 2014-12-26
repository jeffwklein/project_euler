terms = []
for a in 2..100
  for b in 2..100
    terms << a**b
  end
end
terms.uniq!
puts terms.size
