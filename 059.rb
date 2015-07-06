$codes = File.readlines("p059_cipher.txt")[0].split(',').map {|num| num.to_i}

def letter_freq key
  i = 0
  decoded_buffer = []
  common_letter_freq = 0
  $codes.each do |code|
    key_char = key[i%3]
    char_value = key_char.ord ^ code
    common_letter_freq += 1 if char_value.chr =~ /[A-z0-9,. ]/
    i += 1
    # break after a reasonable sample size
    break if i == 100
  end
  return common_letter_freq
end

# all three-letter key characters
alpha = ('a'..'z').to_a
key_trios = alpha.product(alpha).product(alpha).map{|trio| trio.flatten}

highest_freq = 0
solution_key = nil
key_trios.each do |key|
  result = letter_freq(key) 
  if result > highest_freq
    solution_key = key
    highest_freq = result
  end
end

sum = 0
i = 0
$codes.each do |code|
  key_char = solution_key[i%3]
  char_value = key_char.ord ^ code
  sum += char_value
  i += 1
end
puts sum
