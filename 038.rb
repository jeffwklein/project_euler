largest = 0
for i in 1..10000
  used_digits_mask = 0
  concat_str = ""
  for j in 1..9
    multiple = (i*j).to_s
    multiple.each_char do |c|
      shift = c.to_i
      break if shift == 0
      if used_digits_mask & (1 << shift) == 0
        used_digits_mask |= (1 << shift)
      else
        used_digits_mask |= 1
        break
      end
    end
    break if used_digits_mask & 1 == 1
    concat_str += multiple
    break if concat_str.size > 9
    if concat_str.size == 9
      if used_digits_mask == 1022
        if (concat_str.to_i) > largest
          largest = concat_str.to_i
        end
      end
    end
  end
end
puts largest
