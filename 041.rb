require './factors.rb'
answer = 0
for i in 1..9
  for j in 1..i
    (1..j).to_a.map{|e|e.to_s}.permutation.each do |p|
      next if p.last.to_i%2 == 0
      number = p.join.to_i
      if number > answer && Factors.is_prime?(number)
        answer = number
      end
    end
  end
end
puts answer
