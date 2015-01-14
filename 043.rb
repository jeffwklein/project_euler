digits = (0..9).to_a.map { |e| e.to_s }
prime_divisors = [2,3,5,7,11,13,17]
answer = 0
digits.permutation.each do |perm|
  valid = true
  for i in 1..7
    unless perm[i..i+2].join.to_i % prime_divisors[i-1] == 0
      valid = false
      break
    end
  end
  answer += perm.join.to_i if valid
end
puts answer
