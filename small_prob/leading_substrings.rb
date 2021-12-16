def leading_substrings(str)
  arr = []
  str.chars.each do |char|
    case arr.size
    when 0
      arr << char
    else
      arr << arr.last + char
    end
  end
  arr
end

# LS solution
def leading_substrings(str)
  result = []
  0.upto(str.size -1) do |index|
    result << str[0..index]
  end
  result
end

leading_substrings('abc') == ['a', 'ab', 'abc']
leading_substrings('a') == ['a']
leading_substrings('xyzzy') == ['x', 'xy', 'xyz', 'xyzz', 'xyzzy']

def leading_substrings(str)
  index = str.chars.count - 1

end

def leading_substrings(str)
  result = []
  0.upto(str.size - 1) do |index|
    result << string[0..index]
  end
  result
end