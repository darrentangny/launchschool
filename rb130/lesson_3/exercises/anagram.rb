class Anagram
  attr_reader :word

  def initialize(word)
    @word = word.downcase.chars.sort.join
  end

  def match(word_array)
    word_array.map do |el|
      el.downcase.chars.sort.join == word ? el : nil
    end.compact
  end
end