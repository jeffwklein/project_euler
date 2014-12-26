fractions = []
for numerator in 10..99
  for denominator in (numerator+1)..99
    # ones place, string index 1
    n_1 = numerator%10
    d_1 = denominator%10
    # tens place, string index 0
    n_0 = numerator/10
    d_0 = denominator/10
    next if n_1 == 0 && d_1 == 0
    test_n,test_d = 1,1
    if n_1 == d_1
      test_n = n_0
      test_d = d_0
    elsif n_1 == d_0
      test_n = n_0
      test_d = d_1
    elsif n_0 == d_1
      test_n = n_1
      test_d = d_0
    elsif n_0 == d_0
      test_n = n_1
      test_d = d_1
    end
    next if test_d == 0
    if "#{test_n}/#{test_d}".to_r == "#{numerator}/#{denominator}".to_r
      fractions << [numerator, denominator]
    end
  end
end
final_numerator = 1
final_denominator = 1
fractions.each do |pair|
  final_numerator *= pair[0]
  final_denominator *= pair[1]
end
puts "#{final_numerator}/#{final_denominator}".to_r.denominator
