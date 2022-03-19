DECK =  [['S', '2'], ['S', '3'], ['S', '4'], ['S', '5'], ['S', '6'], ['S', '7'], ['S', '8'], ['S', '9'], ['S', '10'], ['S', 'J'], ['S', 'Q'], ['S', 'K'], ['S', 'A']] +
        [['C', '2'], ['C', '3'], ['C', '4'], ['C', '5'], ['C', '6'], ['C', '7'], ['C', '8'], ['C', '9'], ['C', '10'], ['C', 'J'], ['C', 'Q'], ['C', 'K'], ['C', 'A']] +
        [['D', '2'], ['D', '3'], ['D', '4'], ['D', '5'], ['D', '6'], ['D', '7'], ['D', '8'], ['D', '9'], ['D', '10'], ['D', 'J'], ['D', 'Q'], ['D', 'K'], ['D', 'A']] +
        [['H', '2'], ['H', '3'], ['H', '4'], ['H', '5'], ['H', '6'], ['H', '7'], ['H', '8'], ['H', '9'], ['H', '10'], ['H', 'J'], ['H', 'Q'], ['H', 'K'], ['H', 'A']]

SUIT_KEY = { 'H' => 'Hearts', 'D' => 'Diamonds', 'C' => 'Clubs', 'S' => 'Spades' }

RANK_KEY = { 'A' => 'Ace', '1' => 'One', '2' => 'Two', '3' => 'Three', '4' => 'Four',
             '5' => 'Five', '6' => 'Six', '7' => 'Seven', '8' => 'Eight', '9' => 'Nine',
             '10' => 'Ten', 'J' => 'Jack', 'Q' => 'Queen', 'K' => 'King' }

=begin
for what it's worth, launchschool's format:
SUITS = ['H', 'D', 'S', 'C']
VALUES = ['2', '3', '4', '5', '6', '7', '8', '9', '10', 'J', 'Q', 'K', 'A']
they use a method whose block contains: SUITS.product(VALUES).shuffle
=end

require 'io/console'

# source for #continue_game: https://stackoverflow.com/questions/34594018/how-to-code-press-key-to-continue
def continue_game
  print "Press any key to continue"
  STDIN.getch
  print "            \r" # extra space to overwrite in case next sentence is short
end

def deal_card(deck)
  card = deck.sample
  deck.delete(card)
  card
end

def initial_deal(player, dealer, deck)
  loop do
    player << deal_card(deck)
    dealer << deal_card(deck)
    break if player.count == 2
  end
end

def prompt(msg)
  puts "\n=> #{msg}"
end

def card_name(card)
  RANK_KEY[card[1]] + ' of ' + SUIT_KEY[card[0]]
end

def translate_hand(hand)
  hand.map do |card|
    card_name(card)
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

def announce_hand(hand)
  joinor(translate_hand(hand)).to_s
end

def dealer_hand(dealer)
  "#{card_name(dealer[0])} and #{dealer.count - 1} unknown card(s)"
end

def hand_sum(hand)
  sum = 0
  ace_count = 0
  hand.each do |card|
    if card[1] == 'J' || card[1] == 'Q' || card[1] == 'K'
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

loop do
  deck = DECK
  player = []
  dealer = []
  initial_deal(player, dealer, deck)

  loop do
    break if hand_sum(player) > 21
    puts "\nYour hand: #{announce_hand(player)}"
    puts "\nDealer hand: #{dealer_hand(dealer)}"
    puts "\nCurrent hand value: #{hand_sum(player)}\n"
    prompt "Enter (1) to Hit and press (2) to Stay."
    answer = gets.chomp
    if answer == '1'
      player << deal_card(deck)
      puts "\nYou were dealt the #{card_name(player.last)}"
      continue_game
    elsif answer == '2'
      break
    else
      puts "Please enter a choice."
      next
    end
    puts "\nCurrent hand value: #{hand_sum(player)}"
    # continue_game
  end
  loop do
    break if (hand_sum(player) == 21 && player.count == 2) || (hand_sum(player) > 21)
    break if hand_sum(dealer) > hand_sum(player)
    puts "Dealer hand: #{announce_hand(dealer)}"
    puts "Current hand value: #{hand_sum(dealer)}"
    continue_game
    case hand_sum(dealer)
    when 0..16
      dealer << deal_card(deck)
      puts "\nDealer was dealt the #{card_name(dealer.last)}."
      # puts "\nDealer hand: #{announce_hand(dealer)}"
      # puts "\nCurrent hand value: #{hand_sum(dealer)}"
    when 17..21
      puts "\nDealer was dealt the #{card_name(dealer.last)}."
      puts "\nDealer hand: #{announce_hand(dealer)}"
      puts "\nDealer stays."
      break
    else
      break
    end
  end

  if (hand_sum(player) == 21 && player.count == 2) && (hand_sum(dealer) != 21 || dealer.count != 2)
    puts "\nBlackjack! Player wins!"
  elsif hand_sum(player) > 21
    puts "Bust. Dealer wins."
  elsif hand_sum(dealer) > 21
    puts "\nDealer was dealt the #{card_name(dealer.last)}."
    continue_game
    puts "Dealer busts! Player wins!"
  elsif hand_sum(player) > hand_sum(dealer)
    puts "\nPlayer score: #{hand_sum(player)}"
    puts "\nDealer score: #{hand_sum(dealer)}"
    puts "\nPlayer wins!"
  elsif hand_sum(dealer) == 21 && dealer.count == 2 && (hand_sum(player) != 21 || player.count != 2)
    puts "Blackjack! Dealer wins."
  elsif hand_sum(player) == hand_sum(dealer)
    puts "\nPlayer score: #{hand_sum(player)}"
    puts "\nDealer score: #{hand_sum(dealer)}"
    puts "\nTie."
  else
    puts "\nPlayer score: #{hand_sum(player)}"
    puts "\nDealer score: #{hand_sum(dealer)}"
    puts "\n Dealer wins."
  end

  prompt "Would you like to play again? (y/n)"
  answer = gets.chomp
  if answer.downcase == 'y'
    next
  else
    break
  end
end
