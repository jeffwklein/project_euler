# generate lists
lists = []
for increment in 1..6
  sum = 0; count = 1
  sequence = []
  while sum+count < 10000
    sum += count
    sequence << sum if sum >= 1000
    count += increment
  end
  lists << sequence
end

# checks that two 4-digit numbers are cyclic
def is_cyclic a, b
  return a % 100 == b / 100
end

$first = 0
def find_chain order, last, sum
  search = order.shift
  if search.nil? && is_cyclic(last, $first)
    puts sum
    exit
  end
  unless search.nil?
    search.each do |number|
      if last.nil?
        $first = number
        find_chain(order.clone, number, sum + number)
      elsif is_cyclic(last, number)
        find_chain(order.clone, number, sum + number)
      end
    end
  end
end

lists.permutation.each do |order|
  find_chain(order, nil, 0)
end
