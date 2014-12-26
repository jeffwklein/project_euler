# N x N spiral:
# sum from i=1 to (N-1)/2 : 4*(2*i+1)**2 - 6*((2*i+1)-1)
# simply, 4*n**2 - 6*(n-1)  <---(map n to 2*i+1), then add 1 after all that for center
# N = 1001, (N-1)/2 = 500
squares = (1..500).map { |i| 2*i + 1 }
answer = squares.inject(0) { |result, n| result + (4*n**2 - 6*(n-1)) } + 1  # add 1 for center of spiral
puts answer
