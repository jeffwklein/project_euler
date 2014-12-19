require './factors.rb'
count = 0
number = 1
until count == 10001
  number+=1
  if Factors.is_prime? number
    count+=1
  end
end
puts number
