def num_digits n
  return n.to_s.size
end

$answers = []

def find_five_permutations(list)
  digit_map = Hash.new { |h,k| h[k] = [] }
  list.each { |number| digit_map[number.to_s.split('').sort] << number }
  digit_map.keys.each do |key|
    if digit_map[key].size == 5
      $answers << digit_map[key]
    end
  end
end

digits = 1
index = 1
cubes = []
while digits < 13
  cube = index**3
  n_digits = num_digits(cube)
  if n_digits > digits
    if digits > 7
      #puts cubes.inspect
      find_five_permutations(cubes)
      if $answers.size > 0
        puts $answers.flatten.sort.first
      end
    end
    digits = n_digits
    cubes = []
  end
  cubes << cube
  index += 1
end
