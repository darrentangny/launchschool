def word_sizes(str)
  arr = str.split.map do |word|
    word.size
  end
  unique_count = arr.uniq
  unique_count.to_h do |element|
    [element, arr.count(element)]
  end
end

word_sizes('Four score and seven.') == { 3 => 1, 4 => 1, 5 => 1, 6 => 1 }
word_sizes('Hey diddle diddle, the cat and the fiddle!') == { 3 => 5, 6 => 1, 7 => 2 }
word_sizes("What's up doc?") == { 6 => 1, 2 => 1, 4 => 1 }
word_sizes('') == {}