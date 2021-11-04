# 1. Initialize deck
# 2. Deal cards to player and dealer
# 3. Player turn: hit or stay
#   - repeat until bust or "stay"
# 4. If player bust, dealer wins.
# 5. Dealer turn: hit or stay
#   - repeat until total >= 17
# 6. If dealer bust, player wins.
# 7. Compare cards and declare winner.

require 'pry'

DECK =  [['S', '2'], ['S', '3'], ['S', '4'], ['S', '5'], ['S', '6'], ['S', '7'], ['S', '8'], ['S', '9'], ['S', '10'], ['S', 'J'], ['S', 'Q'], ['S', 'K'], ['S', 'A']] +
        [['C', '2'], ['C', '3'], ['C', '4'], ['C', '5'], ['C', '6'], ['C', '7'], ['C', '8'], ['C', '9'], ['C', '10'], ['C', 'J'], ['C', 'Q'], ['C', 'K'], ['C', 'A']] +
        [['D', '2'], ['D', '3'], ['D', '4'], ['D', '5'], ['D', '6'], ['D', '7'], ['D', '8'], ['D', '9'], ['D', '10'], ['D', 'J'], ['D', 'Q'], ['D', 'K'], ['D', 'A']] +
        [['H', '2'], ['H', '3'], ['H', '4'], ['H', '5'], ['H', '6'], ['H', '7'], ['H', '8'], ['H', '9'], ['H', '10'], ['H', 'J'], ['H', 'Q'], ['H', 'K'], ['H', 'A']]

def deal_card(deck)
  card = deck.sample
  deck.delete(card)
  card
end

def prompt(msg)
  puts "=> #{msg}"
end

def suit(card)
  case card
  when 'S'
    'Spades'
  when 'C'
    'Clubs'
  when 'D'
    'Diamonds'
  when 'H'
    'Hearts'
  end
end

def translate(card)
  case card
  when 'A'
    'Ace'
  when 'K'
    'King'
  when 'Q'
    'Queen'
  when 'J'
    'Jack'
  else
    return card
  end
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

player_hand = []
dealer_hand = []
player_sum = 0
dealer_sum = 0

loop do
  deck = DECK

  # Initial dealing of cards
  loop do
    if player_hand.count < 2
      player_hand << deal_card(deck)
      dealer_hand << deal_card(deck)
    else
      break
    end
  end

  loop do

    # Player turn, check for bust/blackjack, if bust dealer win
    loop do
      puts "Cards in hand:"
      player_hand.each { |array| puts "#{translate(array[1])} of #{suit(array[0])}" }
      puts "Dealer hand: #{translate(dealer_hand[0][1])} of #{suit(dealer_hand[0][0])} and #{(dealer_hand.count - 1).to_s} unknown card"
      prompt "Press (1) to Hit and press (2) to Stay."
      answer = gets.chomp
      card = []
      if answer == '1'
        card << deal_card(deck)
        puts "You were dealt: #{card[0][1]} of #{suit(card[0][0])}"
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

    # 
    loop do
    end

    break # next program goes here
  end
  break
end