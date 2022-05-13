text = File.read('madlibs.txt')
adjectives = %w(quick lazy sleepy ugly)
nouns = %w(fox dog head leg)
verbs = %w(jumps lifts bites licks)
adverbs = %w(easily lazily noisily excitedly)

# Note: sample function always returns the same adjective
# until text.include?("%{adjective}") == false
#   text.sub!("%{adjective}", adjectives.sample)
# end

# sample function works properly here
until !text.include?("%")
  text.sub!("%{adjective}", adjectives.sample)
  text.sub!("%{verb}", verbs.sample)
  text.sub!("%{adverb}", adverbs.sample)
  text.sub!("%{noun}", nouns.sample)
end

