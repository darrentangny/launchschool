require 'pry'

class Player
  attr_accessor :hand
  attr_reader :staying, :total

  CONVERSION = { 'Ace' => 11, 'Two' => 2, 'Three' => 3,
      'Four' => 4, 'Five' => 5, 'Six' => 6, 'Seven' => 7,
      'Eight' => 8, 'Nine' => 9, 'Ten' => 10, 'Jack' => 10,
      'Queen' => 10, 'King' => 10 }

  def initialize
    @hand = []
    @total = 0
    @staying = false
    # what would the "data" or "states" of a Player object entail?
    # maybe cards? a name?
  end

  def hit(deck)
    @hand << deck.deck.pop
  end

  def stay
    @staying = true
  end

  def show_cards
    print "You have "
    (0...((hand.size) -1)).each do |idx|
      print "the #{hand[idx][0]} of #{hand[idx][1]}, "
    end
    puts "and the #{hand[-1][0]} of #{hand[-1][1]}."
    puts "Your total is #{@total}."
  end

  def busted?
    total_adjust
    @total > 21
  end

  private

  def total_adjust
    ace_count = 0
    total = 0
    @hand.each do |card|
      total += CONVERSION[card[0]]
      if card[1] == 'Ace' then ace_count += 1; end
    end
    loop do
      break if total <= 21 || ace_count < 1
      total -= 10
    end
    @total = total
  end
end

class Dealer < Player
  def hit(deck)
    until @total >= 17
      @hand << deck.deck.pop
      total_adjust
    end
    stay
  end

  def show_cards
    print "Dealer had "
    (0...((hand.size) -1)).each do |idx|
      print "the #{hand[idx][0]} of #{hand[idx][1]}, "
    end
    puts "and the #{hand[-1][0]} of #{hand[-1][1]}."
    puts "Dealer's total is #{@total}."
  end
end

class Deck
  attr_reader :deck
  def initialize
    @deck = []
    populate_deck
    # obviously, we need some data structure to keep track of cards
    # array, hash, something else?
  end

  def deal(player)
    dealt_cards = []
    2.times { dealt_cards << @deck.pop}
    player.hand = dealt_cards
  end

  private

  def populate_deck
    suits = %w(Diamonds Hearts Spades Clubs)
    values = %w(Ace Two Three Four Five Six Seven Eight
      Nine Ten Jack Queen King)
    result = []
    suits.each do |suit|
      values.each do |value|
        result << [value, suit]
      end
    end
    @deck = result.shuffle
  end
end

# class Card
#   def initialize
#     # what are the "states" of a card?
#   end
# end

class Game
  attr_reader :player, :dealer, :deck
  def initialize
    @deck = Deck.new
    @player = Player.new
    @dealer = Dealer.new
  end

  def start
    deal_cards(player, dealer)
    show_initial_cards(player.hand, dealer.hand)
    player_turn
    dealer_turn
    show_result
  end

  private

  def deal_cards(player, dealer)
    deck.deal(player)
    deck.deal(dealer)
  end

  def show_initial_cards(hand, dealer_hand)
    print "You have "
    (0...((hand.size) -1)).each do |idx|
      print "the #{hand[idx][0]} of #{hand[idx][1]}, "
    end
    puts "and the #{hand[-1][0]} of #{hand[-1][1]}."
    puts "The dealer has the #{dealer_hand[0][0]} of " +
      "#{dealer_hand[0][1]} and one unknown card."
  end

  def player_turn
    until player.busted? || player.staying == true
      hit_or_stay
    end
    if player.busted?
      puts "You busted."
      player.show_cards
    else
      puts "You are staying."
      player.show_cards
    end
  end

  def hit_or_stay
    puts player.show_cards
    puts "Would you like to hit (1) or stay (2)?"
    answer = ''
    loop do
      answer = gets.chomp
      break if answer == '1' || answer == '2'
      puts "Please enter 1 to hit or 2 to stay."
    end
    answer == '1' ? player.hit(deck) : player.stay
  end

  def dealer_turn
    loop do
      break if player.busted?
      dealer.hit(deck)
      break
    end
  end

  def show_result
    if player.busted?
      puts "Player loses!"
    elsif dealer.busted?
      puts "Dealer busts."
      dealer.show_cards
      puts "Player wins!"
    else
      dealer.show_cards
      print_total
      if player.total > dealer.total
        puts "Player wins!"
      else
        puts "Dealer wins!"
      end
    end
  end

  def print_total
    puts "Player's total is #{player.total} and Dealer's total is " +
      "#{dealer.total}."
  end
end

Game.new.start