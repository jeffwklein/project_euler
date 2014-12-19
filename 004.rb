def is_palindrome? str
  j = str.size-1
  for i in 0..str.size/2-1
    return false unless str[i]==str[j]
    j-=1
  end
  return true
end

largest = 0
for x in 100..999
  for y in x..999
    product = x*y
    largest = product if product > largest && is_palindrome?(product.to_s)
  end
end
puts largest
