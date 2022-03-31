deck = []

suits = %w(Diamonds Hearts Spades Clubs)
values = %w(Ace Two Three Four Five Six Seven Eight
  Nine Ten Jack Queen King)
result = []
suits.each do |suit|
  values.each do |value|
    result << [value, suit]
  end
end
deck = result.shuffle

hand = []
3.times { hand << deck.pop }

def display(hand)
  print "You have "
  (0...((hand.size) -1)).each do |idx|
    print "the #{arr[idx][0]} of #{arr[idx][1]}, "
  end
  puts "and the #{arr[-1][0]} of #{arr[-1][1]}."
end

display(hand)