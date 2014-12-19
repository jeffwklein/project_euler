puts File.readlines("p022_names.txt").join('').chomp.split(",").sort.each_with_index.inject(0) { |sum,(str,i)| sum + (i+1)*(str[1..str.size-2].each_byte.inject(0){|score,byte| score + byte - 64}) }
