require 'pry'

text = File.read('madlibs.txt')
adjectives = %w(quick lazy sleepy ugly)
nouns = %w(fox dog head leg)
verbs = %w(jumps lifts bites licks)
adverbs = %w(easily lazily noisily excitedly)

# arr = text.split.map do |word|
#   case word
#   when '%{verb}'
#     word.replace verbs.sample
#   when '%{adjective}'
#     word.replace adjectives.sample
#   when '%{noun}'
#     word.replace nouns.sample
#   when '%{adverb}'
#     word.replace adverbs.sample
#   else
#     word
#   end
# end

str = text.split('%{verb}')
placeholder = str.pop
str.map { |substring| substring + verbs.sample}.flatten.join(' ') + ' ' + \
placeholder[-1]

binding.pry

str = str.split('%{adverb}').map {
  |substring| substring + adverbs.sample
}.flatten.join(' ')

binding.pry

str = str.split('%{noun}').map {
  |substring| substring + nouns.sample
}.flatten.join(' ')

binding.pry

str = str.split('%{adjective}').map {
  |substring| substring + adjectives.sample
}.flatten.join(' ')

binding.pry

puts str