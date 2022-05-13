# Write a method that takes an Array of numbers and then returns the sum of the 
# sums of each leading subsequence for that Array. You may assume that the Array
# always contains at least one number.

# Examples:

sum_of_sums([3, 5, 2]) == (3) + (3 + 5) + (3 + 5 + 2) # -> (21)
sum_of_sums([1, 5, 7, 3]) == (1) + (1 + 5) + (1 + 5 + 7) + (1 + 5 + 7 + 3) # -> (36)
sum_of_sums([4]) == 4
sum_of_sums([1, 2, 3, 4, 5]) == 35

def sum_of_sums(arr)
  sum = 0
  accumulator = 0

  arr.each do |num|
    accumulator += num
    sum += accumulator
  end

  sum
end

def sum_of_sums(arr)
  sum = 0
  1.upto(arr.size) do |count|
    sum += arr.slice(0, count).reduce(:+)
  end
  sum
end

def sum_of_sums(arr)
  arr.map.with_index { |_, idx| arr[0..idx].sum }.sum
end

def sum_of_sums(array)
  array.each_with_object([0]) {|num,array| array << num + array.last}.inject(:+)
end

def sum_of_sums(arr)
  total = 0
  count = 1
  (arr.size).times do |_|
    total += arr[0, count].sum
    count += 1
  end
  total
end

########################

