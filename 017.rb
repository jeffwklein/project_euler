ones = ["","one","two","three","four","five","six","seven","eight","nine"]
teens = ["ten","eleven","twelve","thirteen","fourteen","fifteen","sixteen","seventeen","eighteen",
         "nineteen"]
tens = ["","","twenty","thirty","forty","fifty","sixty","seventy","eighty","ninety"]

words = []
for i in 1..1000
  if i == 1000
    words << "onethousand"
    next
  end
  number_str = i.to_s
  if i < 10
    number_str = "00"+number_str
  elsif i < 100
    number_str = "0"+number_str
  end
  final = "#{ones[number_str[0].to_i]}"
  if number_str[0].to_i > 0
    final += "hundred"
  end
  unless number_str[1..2] == "00" || number_str[0] == "0"
    final += "and"
  end
  if number_str[1] == "1"
    final += "#{teens[number_str[2].to_i]}"
  else
    final += "#{tens[number_str[1].to_i]}#{ones[number_str[2].to_i]}"
  end
  words << final
end
puts words.join('').size
