for n in 1..10000
  a0 = Math.sqrt(n).floor
  next unless Math.sqrt(n) - a0  > 0
end
