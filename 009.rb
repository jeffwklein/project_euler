def is_pythagorean_triplet? a, b, c
  return (a**2 + b**2) == c**2
end

for a in 1..333
  for b in a..((1000-a)/2)
    c = 1000 - (a + b)
    if is_pythagorean_triplet? a, b, c
      puts "#{a*b*c}"
      break
    end
  end
end
