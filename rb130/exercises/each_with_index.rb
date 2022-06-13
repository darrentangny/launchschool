# def each_with_index(arr)
#   0.upto(arr.size - 1) do |idx|
#     yield(arr[idx], idx)
#   end
#   arr
# end

def each_with_index(arr)
  idx = 0
  until idx == arr.size do
    yield(arr[idx], idx)
    idx += 1
  end
  arr
end

def each_with_index(array)
  index = 0
  array.each do |item|
    yield(item, index)
    index += 1
  end
end

result = each_with_index([1, 3, 6]) do |value, index|
  puts "#{index} -> #{value**index}"
end

puts result == [1, 3, 6]