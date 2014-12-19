def evenly_divisible_by_one_through_twenty number
  20.downto(1) do |i|
    return false unless number%i == 0
  end
  return true
end

number = 2520
while true
  if evenly_divisible_by_one_through_twenty number
    puts "Lowest: #{number}"
    break
  end
  number += 20
end

