def leading_substrings(str)
  result = []
  0.upto(str.size - 1) do |index|
    result << str[0..index]
  end
  result
end

def substrings(string)
  results = []
  (0...string.size).each do |start_index|
    this_substring = string[start_index..-1]
    results.concat(leading_substrings(this_substring))
  end
  results
end

