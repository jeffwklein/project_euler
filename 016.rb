puts "#{(2**1000).to_s.split('').inject(0) { |r, n| r + (n.to_i) }}"
