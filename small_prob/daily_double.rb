def crunch(str)
  arr = []
  str.chars.each do |char|
    arr << char unless char == arr.last
  end
  arr.join
end

crunch('ddaaiillyy ddoouubbllee') == 'daily double'
crunch('4444abcabccba') == '4abcabcba'
crunch('ggggggggggggggg') == 'g'
crunch('a') == 'a'
crunch('') == ''