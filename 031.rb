coins = [1,2,5,10,20,50,100] 

amount = 0
answer = 1 # start at 1 to account for 200p piece

for ones in 0..200
  amount += ones*coins[0]
  for twos in 0..(100 - amount/coins[1])
    if amount >= 200
      answer += 1 if amount == 200
      break
    end
    amount += twos*coins[1]
    for fives in 0..(40 - amount/coins[2])
      if amount >= 200
        answer += 1 if amount == 200
        break
      end
      amount += fives*coins[2]
      for tens in 0..(20 - amount/coins[3])
        if amount >= 200
          answer += 1 if amount == 200
          break
        end
        amount += tens*coins[3]
        for twenties in 0..(10 - amount/coins[4])
          if amount >= 200
            answer += 1 if amount == 200
            break
          end
          amount += twenties*coins[4]
          for fifties in 0..(4 - amount/coins[5])
            if amount >= 200
              answer += 1 if amount == 200
              break
            end
            amount += fifties*coins[5]
            for hundreds in 0..(2 - amount/coins[6])
              if amount >= 200
                answer += 1 if amount == 200
                break
              end
              amount += hundreds*coins[6]
              if amount >= 200
                answer += 1 if amount == 200
              end
              amount -= hundreds*coins[6]
            end
            amount -= fifties*coins[5]
          end
          amount -= twenties*coins[4]
        end
        amount -= tens*coins[3]
      end
      amount -= fives*coins[2]
    end
    amount -= twos*coins[1]
  end
  amount -= ones*coins[0]
end

puts answer
