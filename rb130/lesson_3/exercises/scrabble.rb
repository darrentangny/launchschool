# Top-level class documentation comment
# class Scrabble
#   attr_reader :word

#   def initialize(word)
#     @word = word
#     @scores = Hash.new(0)

#     %w[a e i o u l n r s t].each { |letter| @scores[letter] = 1 }
#     %w[d g].each { |letter| @scores[letter] = 2 }
#     %w[b c m p].each { |letter| @scores[letter] = 3 }
#     %w[f h v w y].each { |letter| @scores[letter] = 4 }
#     @scores['k'] = 5
#     %w[j x].each { |letter| @scores[letter] = 8 }
#     %w[q z].each { |letter| @scores[letter] = 10 }
#   end

#   def score
#     return 0 if word.class != String

#     word.chars.map { |letter| @scores[letter.downcase] }.sum
#   end

#   def self.score(word)
#     Scrabble.new(word).score
#   end
# end

# LS Solution
class Scrabble
  attr_reader :word

  POINTS = {
    'AEIOULNRST' => 1,
    'DG' => 2,
    'BCMP' => 3,
    'FHVWY' => 4,
    'K' => 5,
    'JX' => 8,
    'QZ' => 10
  }.freeze

  # rubocop:disable Style/UnneededCondition
  def initialize(word)
    @word = word ? word : ''
  end
  # rubocop:enable Style/UnneededCondition

  def score
    letters = word.upcase.gsub(/[^A-Z]/, '').chars

    total = 0
    letters.each do |letter|
      POINTS.each do |all_letters, point|
        total += point if all_letters.include?(letter)
      end
    end
    total
  end

  def self.score(word)
    Scrabble.new(word).score
  end
end
