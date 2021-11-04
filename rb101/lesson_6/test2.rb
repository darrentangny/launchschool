DECK =  [['S', '2'], ['S', '3'], ['S', '4'], ['S', '5'], ['S', '6'], ['S', '7'], ['S', '8'], ['S', '9'], ['S', '10'], ['S', 'J'], ['S', 'Q'], ['S', 'K'], ['S', 'A']] +
        [['C', '2'], ['C', '3'], ['C', '4'], ['C', '5'], ['C', '6'], ['C', '7'], ['C', '8'], ['C', '9'], ['C', '10'], ['C', 'J'], ['C', 'Q'], ['C', 'K'], ['C', 'A']] +
        [['D', '2'], ['D', '3'], ['D', '4'], ['D', '5'], ['D', '6'], ['D', '7'], ['D', '8'], ['D', '9'], ['D', '10'], ['D', 'J'], ['D', 'Q'], ['D', 'K'], ['D', 'A']] +
        [['H', '2'], ['H', '3'], ['H', '4'], ['H', '5'], ['H', '6'], ['H', '7'], ['H', '8'], ['H', '9'], ['H', '10'], ['H', 'J'], ['H', 'Q'], ['H', 'K'], ['H', 'A']]

SUIT_KEY = { 'H' => 'Hearts', 'D' => 'Diamonds', 'C' => 'Clubs', 'S' => 'Spades' }
RANK_KEY = { 'A' => 'Ace', '1' => 'One', '2' => 'Two', '3' => 'Three', '4' => 'Four',
             '5' => 'Five', '6' => 'Six', '7' => 'Seven', '8' => 'Eight', '9' => 'Nine',
             '10' => 'Ten', 'J' => 'Jack', 'Q' => 'Queen', 'K' => 'King' }

def deal_card(deck)
  card = deck.sample
  deck.delete(card)
  card
end

def prompt(msg)
  puts "=> #{msg}"
end

def card_name(card)
  RANK_KEY[card[1]] + ' of ' + SUIT_KEY[card[0]]
end

def translate_hand(hand)
  hand.map do |card|
    card_name(card)
  end
end

def announce_hand(hand)
  puts "Your hand: #{joinor(translate_hand(hand), ', ', 'and')}"
end

def hand_sum(hand)
  sum = 0
  ace_count = 0
  hand.each do |card|
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
      ace_count -1
  end
  sum
end  

def initial_deal(player, dealer, deck)
  loop do
    player << deal_card(deck)
    dealer << deal_card(deck)
    break if player.count == 2
  end
end

def joinor(arr, delimiter = ', ', word = 'and')
  case arr.size
  when 0 then ''
  when 1 then arr.first
  when 2 then arr.join(" #{word} ")
  else
    arr[-1] = "#{word} #{arr.last}"
    arr.join(delimiter)
  end
end

def display(hand)
  placeholder = []
  translated_hand = []
  printed_hand = []
  placeholder << hand.map do |hand|
    translate(hand[1])
  end
  translated_hand << placeholder.map do |hand|
    suit(hand[1])
  end
  printed_hand << translated_hand.map do |hand|
    joinor(hand, ', ', 'and')
  end
  p printed_hand
  printed_hand.each { |hands| puts "Player hand: #{hands}" }
end

player_hand = []
dealer_hand = []
player_sum = []
dealer_sum = []
deck = DECK

initial_deal(player_hand, dealer_hand, deck)

loop do
  announce_hand(player_hand)
  puts "Dealer hand: #{card_name(dealer_hand[0])} and one unknown card."
  prompt "Press (1) to Hit and press (2) to Stay."
  answer = gets.chomp
  card = []
  if answer == '1'
    card << deal_card(deck)
    puts "You were dealt: #{card_name(card[0])}"
    player_hand << deal_card(card)
  elsif answer == '2'
    break
  else
    puts "Invalid answer. Try again."
  end
  if hand_sum(player_hand) > 21
    puts "Bust"
    break
  end
end