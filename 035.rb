require './factors.rb'
$prime = {}
def check_rotations n
  chars = n.to_s.split('')
  chars.size.times do |i|
    rotation = (chars << chars.shift).join('').to_i
    if $prime[rotation].nil?
      prime = Factors.is_prime?(rotation)
      $prime[rotation] = true if prime
      $prime[rotation] = false unless prime
    end
    return false unless $prime[rotation]
  end
  return true
end

sum = 0
for i in 1..1000000
  sum += i if check_rotations(i)
  puts i if i%10000 == 0
end
puts sum
