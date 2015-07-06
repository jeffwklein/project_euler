$answer = 0

def find_fraction iterations_left, numerator=3, denominator=2
  frac = Rational("#{numerator}/#{denominator}")
  iterations_left -= 1
  return frac if iterations_left == 0
  new_numerator = 2*denominator + numerator
  new_denominator = denominator + numerator
  $answer += 1 if (new_numerator.to_s.size > new_denominator.to_s.size)
  find_fraction iterations_left, new_numerator, new_denominator
end

find_fraction 1000
puts $answer
