# def reverse(arg)
#   left_index = 0
#   right_index = 0

#   while left_index < arg.size / 2
#     arg[left_index], arg[right_index] = arg[right_index], arg[left_index]
#     left_index += 1
#     right_index -= 1
#   end

#   arg
# end

def reverse(arg)
  new_arr = []
  arg.reverse_each do |element|
    new_arr << element
  end
  new_arr
end