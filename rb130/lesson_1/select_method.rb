def select(array)
  counter = 0
  result = []

  while counter < array.size
    yield(array[counter]) ? result << array[counter] : nil
    counter += 1
  end

  result
end

array = [1,2,3,4,5]
p select(array) { |num| num.odd? }
# select(array) { |num| puts num }
# select(array) { |num| num + 1 }