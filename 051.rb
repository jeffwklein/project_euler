require './prime.rb'
is_prime = {}
answer = nil
current_max_len = 2
while answer.nil?
  index_sets = []
  for i in 1..current_max_len-1
    index_sets += (0..current_max_len-1).to_a.combination(i).to_a
  end
  digits = Array.new(current_max_len,nil)
  index_sets.each do |replace_indices|
    digit_indices = (0..current_max_len-1).to_a - replace_indices
    (0..9).to_a.repeated_permutation(digit_indices.size) do |perm|
      next if perm[0] == 0 && replace_indices[0] == 0
      next if replace_indices.last == current_max_len-1 && perm.last%2 == 0
      digit_indices.each_with_index {|val,i| digits[val] = perm[i].to_s}
      misses = 0
      for r in 0..9
        if r == 0 && replace_indices[0] == 0
          misses += 1
          next
        end
        replace_indices.each {|i| digits[i] = r.to_s}
        number = digits.join.to_i
        is_prime[number] = number.prime? if is_prime[number].nil?
        misses += 1 unless is_prime[number]
        break if misses > 2
      end
      if misses < 3
        (1..9).each do |p|
          next if p == 0 && replace_indices[0] == 0 # accounts for leading zeros
          replace_indices.each {|i| digits[i] = p}
          number = digits.join.to_i
          is_prime[number] = number.prime? if is_prime[number].nil?
          if is_prime[number]
            answer = number if answer.nil? || number < answer
            break
          end
        end
      end
    end
  end
  current_max_len += 1
end
puts answer

