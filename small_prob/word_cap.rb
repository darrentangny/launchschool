def word_cap(str)
  str.split.each { |word| word.capitalize! }.join(' ')
end

word_cap('four score and seven') == 'Four Score And Seven'
word_cap('the javaScript language') == 'The Javascript Language'
word_cap('this is a "quoted" word') == 'This Is A "quoted" Word'

def word_cap(words)
  words.split.map(&:capitalize).join(' ')
end