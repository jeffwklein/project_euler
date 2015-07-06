require './prime.rb'

$is_prime = {}

def check_prime n
  $is_prime[n] = n.prime? if $is_prime[n].nil?
  return $is_prime[n]
end

def num_digits n
  return 1 if n < 10
  return 2 if n < 100
  return 3 if n < 1000
  return 4 if n < 10000
  return 5 if n < 100000
end

def check_concatenate n, m
  cat1 = (10**num_digits(m))*n + m
  cat2 = (10**num_digits(n))*m + n
  return check_prime(cat1) && check_prime(cat2)
end


#first_four = [3,7,109,673]

sum = 0
lowest = 100000

for a in 3..10000
  next unless check_prime(a)
  sum += a
  for b in 7..10000
    next unless check_prime(b)
    next if b == a
    next unless check_concatenate(a,b)
    next if sum+b > lowest
    sum += b
    for c in 109..10000
      next unless check_prime(c)
      next if c == a
      next if c == b
      next unless check_concatenate(a,c)
      next unless check_concatenate(b,c)
      next if sum+c > lowest
      sum += c
      for d in 673..10000
        next unless check_prime(d)
        next if d == a
        next if d == b
        next if d == c
        next unless check_concatenate(a,d)
        next unless check_concatenate(b,d)
        next unless check_concatenate(c,d)
        next if sum+d > lowest
        sum += d
        for e in 674..10000
          next unless check_prime(e)
          next if e == a
          next if e == b
          next if e == c
          next if e == d
          next unless check_concatenate(a,e)
          next unless check_concatenate(b,e)
          next unless check_concatenate(c,e)
          next unless check_concatenate(d,e)
          next if sum+e > lowest
          sum += e
          if sum < lowest && check_prime(sum)
            puts lowest
            exit
          end
          sum -= e
        end
        sum -= d
      end
      sum -= c
    end
    sum -= b
  end
  sum -= a
end
puts
puts lowest

