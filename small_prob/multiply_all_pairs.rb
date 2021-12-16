# didn't work because of lack of space between minus and 1 on line 3, line 8
# def multiply_all_pairs(arr1, arr2)
#   idx1 = arr1.count -1
#   puts "Index 1 count #{idx1}"
#   new_arr = []
#   loop do
#     break if idx1 < 0
#     idx2 = arr2.count -1
#     puts "Index 2 count: #{idx2}"
#     loop do
#       break if idx2 < 0
#       tmp = arr1[idx1] * arr2[idx2]
#       puts "result: #{tmp}"
#       new_arr << tmp
#       idx2 -= 1
#       puts "index 2 #{idx2}"
#     end
#     idx1 -= 1
#     puts "index 1 #{idx1}"
#   end
#   new_arr.sort
# end

def multiply_all_pairs(arr1, arr2)
  idx1 = arr1.count - 1
  new_arr = []
  loop do
    break if idx1 < 0
    idx2 = arr2.count - 1
    loop do
      break if idx2 < 0
      new_arr << arr1[idx1] * arr2[idx2]
      idx2 -= 1
    end
    idx1 -= 1
  end
  new_arr.sort
end

multiply_all_pairs([2, 4], [4, 3, 1, 2]) 

# LS Method
def multiply_all_pairs(array_1, array_2)
  products = []
  array_1.each do |item_1|
    array_2.each do |item_2|
      prodcuts << item_1 * item_2
    end
  end
  products.sort
end

# Compact alternative
def multiply_all_pairs(array_1, array_2)
  array_1.product(array_2).map { |num1, num2| num1 * num2 }.sort
end