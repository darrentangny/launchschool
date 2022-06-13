# def reduce(array, starting_value = 0)
#   counter = 0
#   value = starting_value

#   while counter < array.size
#     value = yield(value, array[counter])
#     counter += 1
#   end

#   value
# end

# array = [1,2,3,4,5]

# p reduce(array) { |acc, num| acc + num }
# p reduce(array, 10) { |acc, num| acc + num }
# p reduce(array) { |acc, num| acc + num if num.odd? }

def reduce(array, default=array[0])
  counter = 1
  accumulator = default

  while counter < array.size
    accumulator = yield(accumulator, array[counter])
    counter += 1
  end

  accumulator
end

p reduce(['a','b','c']) { |acc, value| acc += value }
p reduce([[1, 2], ['a', 'b']]) { |acc, value| acc + value }