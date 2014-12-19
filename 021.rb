require 'set'
numbers = Set.new
def sum_of_factors n
  ((2..(Math.sqrt(n).to_i)).to_a.keep_if{|d| n%d == 0}.inject([]){|arr, e| arr << e << (n/e)}.uniq << 1).inject(:+)
end
for a in 2..10000
  b = sum_of_factors(a)
  next if a == b 
  if sum_of_factors(b) == a
    numbers << a << b 
  end
end
puts numbers.inject(:+)
