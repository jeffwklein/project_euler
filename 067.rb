require 'pp'
$triangle = []
File.readlines("p067_triangle.txt").each do |line|
  new_a = []
  line.chomp.split(' ').each do |num|
    new_a << num.to_i
  end
  $triangle << new_a
end
pp $triangle

$sum_triangle = []
for i in 1..100
  $sum_triangle << Array.new(i,0)
end

def traverse row, col, sum = 0
  sum += $triangle[row][col]
  if $sum_triangle[row][col] < sum
    $sum_triangle[row][col] = sum
    traverse(row+1, col, sum) if row < 99
    traverse(row+1, col+1, sum) if row < 99
  end
end

traverse 0,0
puts $sum_triangle[99].sort.reverse[0]
