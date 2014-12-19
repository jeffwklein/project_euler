$paths_down = []
21.times do |i|
  new_row = []
  21.times do |j|
    new_row << 0
  end
  $paths_down << new_row
end
$paths_down[20][20] = 1

def traverse row, col
  if row < 20
    traverse row+1, col if $paths_down[row+1][col] == 0
    $paths_down[row][col] += $paths_down[row+1][col]
  end
  if col < 20
    traverse row, col+1 if $paths_down[row][col+1] == 0
    $paths_down[row][col] += $paths_down[row][col+1]
  end
end

traverse 0, 0
puts $paths_down[0][0]
