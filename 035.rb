require './factors.rb'

checked = Array.new(1000001, false)
valid_nums = [2] #add number two to list for sole case of even prime
for i in 3..1000000
  puts "-----#{i}-----" if i%10000 == 0
  next if checked[i]
  checked[i] = true
  all_odd = true
  i.to_s.each_char do |digit|
    all_odd = false if digit.to_i%2 == 0
    break unless all_odd
  end
  next unless all_odd
  rotations = []
  digits = i.to_s.split('')
  valid = true
  digits.size.times do
    new_rotation = (digits << digits.shift).join.to_i 
    valid = false unless Factors.is_prime?(new_rotation)
    rotations << new_rotation
    checked[new_rotation] = true
  end
  if valid
    rotations.each {|r| valid_nums << r }
  end
end
puts valid_nums.size
