def word_to_digit(str)
  str.gsub!(/\bzero\b/, "0")
  str.gsub!(/\bone\b/, "1") 
  str.gsub!(/\btwo\b/, "2") 
  str.gsub!(/\bthree\b/, "3") 
  str.gsub!(/\bfour\b/, "4") 
  str.gsub!(/\bfive\b/, "5") 
  str.gsub!(/\bsix\b/, "6") 
  str.gsub!(/\bseven\b/, "7")
  str.gsub!(/\beight\b/, "8")
  str.gsub!(/\bnine\b/, "9")
  str
end

word_to_digit("Please call me at five five five one two three four. Thanks.") == "Please call me at 5 5 5 1 2 3 4. Thanks."

DIGIT_HASH = { 
  'zero' => '0', 'one' => '1', 'two' => '2', 'three' => '3',
  'four' => '4', 'five' => '5', 'six' => '6', 'seven' => '7',
  'eight' => '8', 'nine' => '9'
}.freeze

def word_to_digit(words)
  DIGIT_HASH.keys.each do |word|
    words.gsub!(/\b#{word}\b/, DIGIT_HASH[word])
  end
  words
end