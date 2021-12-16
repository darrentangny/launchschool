def rotate_array(arr)
  arr[1..-1] + [arr[0]]
end

# rotate_array([7, 3, 5, 2, 9, 1])

# def rotate_rightmost_digits(num, place_value)
#   number = num.to_s.chars
#   number.push(number[-place_value])
#   number.delete_at(-place_value - 1)
#   number.join.to_i
# end

def rotate_rightmost_digits(num, n)
  all_digits = num.to_s.chars
  all_digits[-n..-1] = rotate_array(all_digits[-n..-1])
  all_digits.join.to_i
end

# rotate_rightmost_digits(735291, 1) == 735291
# rotate_rightmost_digits(735291, 2) == 735219
# rotate_rightmost_digits(735291, 3) == 735912
# rotate_rightmost_digits(735291, 4) == 732915
# rotate_rightmost_digits(735291, 5) == 752913
# rotate_rightmost_digits(735291, 6) == 352917

def rotate_array(arr)
  arr[1..-1] + [arr[0]]
end

def rotate_rightmost_digits(num, n)
  all_digits = num.to_s.chars
  all_digits[-n..-1] = rotate_array(all_digits[-n..-1])
  all_digits.join.to_i
end

def max_rotation(num)
  counter = 0
  temp = num
  while temp > 0
    counter += 1
    temp = temp / 10
  end
  until counter == 0
    num = rotate_rightmost_digits(num, counter)
    counter -= 1
  end
  num
end

max_rotation(735291) == 321579
max_rotation(3) == 3
max_rotation(35) == 53
max_rotation(105) == 15 # the leading zero gets dropped
max_rotation(8_703_529_146) == 7_321_609_845