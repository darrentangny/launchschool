class Card
  include Comparable
  attr_reader :rank, :suit

  VALUES = { 'Jack' => 11, 'Queen' => 12, 'King' => 13, 'Ace' => 14 }

  def initialize(rank, suit)
    @rank = rank
    @suit = suit
  end

  def to_s
    "#{rank} of #{suit}"
  end

  def value
    VALUES.fetch(rank, rank)
  end

  def <=>(other_card)
    value <=> other_card.value
  end
end

class Deck
  RANKS = ((2..10).to_a + %w(Jack Queen King Ace)).freeze
  SUITS = %w(Hearts Clubs Diamonds Spades).freeze

  def initialize
    reset
  end

  def draw
    @deck.empty? ? reset : @deck.pop
  end

  # def draw
  #   reset if @deck.empty?
  #   @deck.pop
  # end

  private

  def reset
    @deck = []
    RANKS.each do |rank|
      SUITS.each do |suit|
        @deck << Card.new(rank, suit)
      end
    end
    @deck.shuffle!
  end
end

deck = Deck.new
drawn = []
52.times { drawn << deck.draw }
drawn.count { |card| card.rank == 5 } == 4
drawn.count { |card| card.suit == 'Hearts' } == 13

drawn2 = []
52.times { drawn2 << deck.draw }

p drawn != drawn2 # Almost always.

# Purpose of program: two classes, deck and card classes. Deck class is
# populated by 52 unique cards, can be drawn from, and ultimately resets
# and reshuffles if all cards are drawn

# Cards can be compared with one another via operators
# Problem seems to trace back to line 33 (coincidence!?)
# Commented out method below it actual leads to everything working 
# => true

=begin
# Note that line 88 throws the following error: 

Traceback (most recent call last):
        4: from high_low_2.rb:88:in `<main>'
        3: from high_low_2.rb:88:in `!='
        2: from high_low_2.rb:88:in `=='
        1: from high_low_2.rb:88:in `=='
high_low_2.rb:21:in `<=>': undefined method `value' for [#<Card:0x0000558615fbb440 @rank=6, @suit="Spades">]:Array (NoMethodError)
Did you mean?  values_at
=end