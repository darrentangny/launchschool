def common_chars(array)
  array = array.map {|word| word.dup}
  chars = array.shift.chars
  
  chars.select do |char|
    array.all? { |word| word.sub!(char, "") }
  end
end

arr = ['bella', 'label', 'roller']

p common_chars(arr)