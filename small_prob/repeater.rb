def repeater(str)
  arr = []
  str.chars.map do |char|
    arr << char << char
  end
  arr.join
end

repeater('Hello') 

def repeater(str)
  result = ''
  str.each_char do |char|
    result << char << char
  end
  result
end

def repeater(str)
  str.chars.map { |char| char * 2 }.join
end