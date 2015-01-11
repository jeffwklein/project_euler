def word_value word
  word.each_char.inject(0) {|sum,c| sum + (c.ord - 64)}
end

words = File.readlines("p042_words.txt")[0].split(',').map{|word| word[1..word.size-2] }

triangle_words = 0
words.each do |word|
  val = word_value(word)
  count,triangle = 1,1
  while triangle <= val
    if val == triangle
      triangle_words += 1
      break
    end
    count += 1
    triangle += count
  end
end
puts triangle_words
