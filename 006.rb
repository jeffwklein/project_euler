sum_of_squares = (1..100).inject(0) { |result, n| result + (n**2) }
square_of_sum  = (1..100).inject(:+)**2
difference = square_of_sum - sum_of_squares
puts difference
