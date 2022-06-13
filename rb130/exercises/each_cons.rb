# def each_cons(arr)
#   return nil if arr.empty?
#   counter = 0
#   loop do
#     break if counter == arr.size - 1
#     yield(arr[counter], arr[counter + 1])
#     counter += 1
#   end
#   nil
# end

# def each_cons(arr)
#   arr.each_with_index do |itm, idx|
#     break if idx + 1 >= arr.size
#     yield(itm, arr[idx + 1])
#   end
#   nil
# end

# hash = {}
# result = each_cons([1, 3, 6, 10]) do |value1, value2|
#   hash[value1] = value2
# end
# p result == nil
# p hash == { 1 => 3, 3 => 6, 6 => 10 }

# hash = {}
# result = each_cons([]) do |value1, value2|
#   hash[value1] = value2
# end
# p hash == {}
# p result == nil

# hash = {}
# result = each_cons(['a', 'b']) do |value1, value2|
#   hash[value1] = value2
# end
# p hash == {'a' => 'b'}
# p result == nil

# ***** Modified method to accept variable number of arguments *****
def each_cons(arr, arg_num)
  return nil if arr.empty?
  counter = 0
  loop do
    break if counter + arg_num - 1 >= arr.size
    # yield(arr[counter], *arr[(counter + 1)..(counter + arg_num)]) how not to
    # do it. Note also example below for use of parameter argument
    yield(*arr[counter..(counter + arg_num - 1)])
    counter += 1
  end
  nil
end

hash = {}
each_cons([1, 3, 6, 10], 1) do |value|
  hash[value] = true
end
p hash == { 1 => true, 3 => true, 6 => true, 10 => true }

hash = {}
each_cons([1, 3, 6, 10], 2) do |value1, value2|
  hash[value1] = value2
end
p hash == { 1 => 3, 3 => 6, 6 => 10 }

hash = {}
each_cons([1, 3, 6, 10], 3) do |value1, *values| # parameter argument
  hash[value1] = values
end
p hash == { 1 => [3, 6], 3 => [6, 10] }

hash = {}
each_cons([1, 3, 6, 10], 4) do |value1, *values|
  hash[value1] = values
end
p hash == { 1 => [3, 6, 10] }

hash = {}
each_cons([1, 3, 6, 10], 5) do |value1, *values|
  hash[value1] = values
end
p hash == {}

