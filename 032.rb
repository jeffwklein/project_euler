require './factors.rb'
answer = 0
for p in 1234..9876
  factors = Factors.factors_of(p)
  while factors.size > 1
    a,b = factors.shift,factors.pop
    if [a,b,p].join('').split('').map{|e|e.to_i}.sort == (1..9).to_a
      answer += p
      break
    end
  end
end 
puts answer
