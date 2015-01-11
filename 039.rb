value_pairs = Array.new(1001,0)
for r in 1..999
  for s in r..999
    hypotenuse = Math.sqrt(r**2 + s**2)
    if hypotenuse.to_i - hypotenuse == 0
      perimeter = r+s+hypotenuse.to_i
      if perimeter <= 1000
        value_pairs[perimeter] += 1
      end
    end
  end
end
highest_i = 0
highest = 0
for i in 0...value_pairs.size
  if value_pairs[i] > highest
    highest = value_pairs[i]
    highest_i = i
  end
end
puts highest_i
