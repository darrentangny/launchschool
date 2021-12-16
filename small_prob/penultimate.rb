# Mine
def penultimate(str)
  arr = str.split
  "#{arr[-2]}"
end

# LS
def penultimate(words)
  words_array = words.split
  words_array[-2]
end

# Best
def penultimate(string)
  string.split[-2]
end


penultimate('last word') == 'last'
penultimate('Launch School is great!') == 'is'