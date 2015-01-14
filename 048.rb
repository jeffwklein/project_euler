sum = (1..1000).inject(0) {|result,n| result + n**n}
puts sum % 10**10
