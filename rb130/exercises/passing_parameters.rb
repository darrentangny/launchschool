items = ['apples', 'corn', 'cabbage', 'wheat']

def gather(items)
  puts "Let's start gathering food."
  yield(items)
  puts "Nice selection of food we have gathered!"
end

# gather(items) { |produce| puts produce.join('; ') }

# birds = ['crow', 'finch', 'hawk', 'eagle']

# def types(birds)
#   yield birds
# end

# types(birds) do |_, _, *raptors|
#   puts "Raptors: #{raptors.join(', ')}."
# end

# gather(items) do |*veggies, wheat|
#   puts veggies.join(', ')
#   puts wheat
# end

# gather(items) do |apples, *corn, wheat|
#   puts apples
#   puts corn.join(', ')
#   puts wheat
# end

# gather(items) do |*apples, wheat|
#   puts apples.join(', ') + " and #{wheat}"
# end

def gather(apples, *assorted)
  puts "Let's start gathering food."
  puts apples
  p assorted
  puts "We've finished gathering!"
end

gather(*items) # note splat is important for line 39 to work properly
