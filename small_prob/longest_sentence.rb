# def longest_sentence(str)
#   arr = str.split('.')
#   arr = arr.map { |sentence| sentence.split('!') }.flatten
#   arr = arr.map { |sentence| sentence.split('?') }.flatten
#   substring = ''
#   arr.each do |sentence| 
#     if sentence.length > substring.length
#       substring = sentence
#     end
#   end
#   if str.match(substring + '.')
#     puts substring + '.'
#   elsif str.match(substring + '!')
#     puts substring + '!'
#   else
#     puts substring + '?'
#   end
# end

# text = File.read('sample_text.txt')
# arr = text.split('.')
# arr = arr.map { |sentence| sentence.split('!') }.flatten
# arr = arr.map { |sentence| sentence.split('?') }.flatten
# substring = ''
# arr.each do |sentence| 
#   if sentence.length > substring.length
#     substring = sentence
#   end
# end
# if text.match(substring + '.')
#   puts (substring + '.').strip
# elsif text.match(substring + '!')
#   puts (substring + '!').strip
# else
#   puts (substring + '?').strip
# end

text = File.read('sample_text.txt')
sentences = text.split(/\.|\?|!/)
largest_sentence = sentences.max_by { |sentence| sentence.split.size }
largest_sentence = largest_sentence.strip
number_of_words = largest_sentence.split.size

puts "#{largest_sentence}"
puts "Containing #{number_of_words} words"