# require 'pry'
def hand_sum(hand)
  sum = 0
  ace_count = 0
  hand.each do |card|
    # binding.pry
    if (card[1] == 'J' || card[1] == 'Q' || card[1] == 'K')
      sum += 10
    elsif card[1] == 'A'
      sum += 11
      ace_count += 1
    else
      sum += card[1].to_s.to_i
    end
  end
  while sum > 21 && ace_count > 0
      sum -= 10
      ace_count -= 1
  end
  sum
end

hand = [['x', '3'], ['x', '10'], ['x', '5'], ['x', 'A'], ['x', '4']]
puts hand_sum(hand)
#result here yields 13
#ok, so it breaks after encountering the ace

#goes up to 29, then breaks, then returns 13 right there
#for whatever reason doesn't return a 19, as might be expected

