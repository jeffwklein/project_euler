def is_abundant n
  (((2..(Math.sqrt(n).to_i)).to_a.keep_if{|d| n%d == 0}.inject([]){|arr, e| arr << e << (n/e)}.uniq << 1).inject(:+)) > n
end
abundant_numbers = []
(1..28123).each { |n| abundant_numbers << n if is_abundant n }
sums_of_two = []
abundant_numbers.each do |i|
  abundant_numbers.each do |j|
    break if j > i
    break if (j+i) > 28123
    sums_of_two << (i+j)
  end
end
puts ((1..28123).to_a - sums_of_two).inject(:+)
