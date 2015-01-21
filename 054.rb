$value_map = {
  "2" => 2,
  "3" => 3,
  "4" => 4,
  "5" => 5,
  "6" => 6,
  "7" => 7,
  "8" => 8,
  "9" => 9,
  "T" => 10,
  "J" => 11,
  "Q" => 12,
  "K" => 13,
  "A" => 14
};
# The method hand_value returns one of the following
# values, corresponding to the best hand you can make
# from a given hand of five cards.
# 0 - high card
# 1 - single pair
# 2 - two pairs
# 3 - three of a kind
# 4 - straight
# 5 - flush
# 6 - full house
# 7 - four of a kind
# 8 - straight flush
# 9 - royal flush
def hand_value cards
  values = cards.map{|c| $value_map[c[0]]}
  suits = cards.map{|c| c[1]}
  is_flush = false
  # check for flush
  if suits.uniq.size == 1
    is_flush = true
  end
  # check for straight
  is_straight = true
  sorted_values = values.sort
  for v in 0..(values.size-2)
    unless sorted_values[v]+1 == sorted_values[v+1]
      is_straight = false
      break
    end
  end
  if is_straight
    if is_flush
      # royal flush
      return {rank: 9, secondary: 10}  if sorted_values[0] == 10
      # straight flush
      return {rank: 8, secondary: sorted_values[0]}
    end
  end
  # check for four of a kind
  if sorted_values[0] == sorted_values[3] || sorted_values[1] == sorted_values[4]
    return {rank: 7, secondary: sorted_values[1]}
  end
  # check for three of a kind or full house
  if sorted_values[0] == sorted_values[2]
    return {rank: 6, secondary: sorted_values[0]} if sorted_values[3] == sorted_values[4]
    return {rank: 3, secondary: sorted_values[0]}
  end
  if sorted_values[2] == sorted_values[4]
    return {rank: 6, secondary: sorted_values[2]} if sorted_values[0] == sorted_values[1]
    return {rank: 3, secondary: sorted_values[2]}
  end
  # check for three of a kind (case where full house is not possible)
  if sorted_values[1] == sorted_values[3]
    return {rank: 3, secondary: sorted_values[1]}
  end
  # return for flush (fine since three of a kind/full house and flush are mutually exclusive)
  return {rank: 5, secondary: sorted_values.last} if is_flush
  # return for straight (fine since three of a kind/full house and straight are mutually exclusive)
  return {rank: 4, secondary: sorted_values[0]} if is_straight
  # check for two pairs
  if sorted_values[0] == sorted_values[1] && sorted_values[2] == sorted_values[3]
    return {rank: 2, secondary: (sorted_values[0] > sorted_values[2] ? sorted_values[0] : sorted_values[2])}
  end
  if sorted_values[0] == sorted_values[1] && sorted_values[3] == sorted_values[4] 
    return {rank: 2, secondary: (sorted_values[0] > sorted_values[3] ? sorted_values[0] : sorted_values[3])}
  end
  if sorted_values[1] == sorted_values[2] && sorted_values[3] == sorted_values[4] 
    return {rank: 2, secondary: (sorted_values[1] > sorted_values[3] ? sorted_values[1] : sorted_values[3])}
  end
  # check for pairs
  return {rank: 1, secondary: sorted_values[0]} if sorted_values[0] == sorted_values[1]
  return {rank: 1, secondary: sorted_values[1]} if sorted_values[1] == sorted_values[2]
  return {rank: 1, secondary: sorted_values[2]} if sorted_values[2] == sorted_values[3]
  return {rank: 1, secondary: sorted_values[3]} if sorted_values[3] == sorted_values[4]
  # otherwise high card
  return {rank: 0, secondary: sorted_values.last}
end

# compares two hands beyond primary and secondary tiebreakers.
# returns 1 for player 1 victory, 2 for player 2 victory, and 0
# if it is truly a tie.
def compare_further p1hand, p2hand, rank, secondary
  p1values = p1hand.map{|c| $value_map[c[0]]}.sort
  p2values = p2hand.map{|c| $value_map[c[0]]}.sort
  # no further comparison if it's a straight
  return 0 if rank == 9 || rank == 8 || rank == 4
  if rank == 7 # four of a kind
    comp1 = (p1values[0] == secondary ? p1values[4] : p1values[0])
    comp2 = (p2values[0] == secondary ? p2values[4] : p2values[0])
    return 1 if comp1 > comp2
    return 2 if comp2 > comp1
    return 0
  end
  if rank == 6 # full house
    comp1 = (p1values - [secondary]).uniq[0]
    comp2 = (p2values - [secondary]).uniq[0]
    return 1 if comp1 > comp2
    return 2 if comp2 > comp1
    return 0
  end
  if rank <= 5 # all remaining ranks
    comp1 = (p1values - [secondary]).uniq.reverse
    comp2 = (p2values - [secondary]).uniq.reverse
    comp1.each_with_index do |e,i|
      return 1 if e > comp2[i]
      return 2 if comp2[i] > e
    end
    return 0
  end
end

answer = 0
hands = File.readlines("p054_poker.txt")
#hands.each do |hand|
for i in 0..(hands.size-1)
  hand = hands[i]
  hand.chomp!
  p1hand = hand.split(' ')[0..4]
  p2hand = hand.split(' ')[5..9]
  p1result = hand_value(p1hand)
  p2result = hand_value(p2hand)
  if p1result[:rank] == p2result[:rank]
    if p1result[:secondary] == p2result[:secondary]
      answer += 1 if compare_further(p1hand, p2hand, p1result[:rank], p1result[:secondary]) == 1
    end
    if p1result[:secondary] > p2result[:secondary]
      answer += 1
    end
  end
  if p1result[:rank] > p2result[:rank]
    answer += 1
  end
end
puts answer
