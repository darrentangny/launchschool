def swap(str)
  str = str.split.each do |word| 
    word[0], word[-1] = word[-1], word[0]
    word #necessary because unexpected return value on line 3, which is apparently a destructive method rather than assignment
  end
  str.join(' ')
end

swap('Oh what a wonderful day it is') == 'hO thaw a londerfuw yad ti si'
swap('Abcde') == 'ebcdA'
swap('a') == 'a'

# def swap_first_last_characters(word)
#   word[0], word[-1] = word[-1], word[0]
#   word
# end

# def swap(words)
#   result = words.split.map do |word|
#     swap_first_last_characters(word)
#   end
#   result.join(' ')
# end
