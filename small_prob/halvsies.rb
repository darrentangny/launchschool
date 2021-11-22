def halvsies(arr)
  half_rounded_up = (arr.count / 2.0).ceil
  new_arr = [[],[]]
  counter = 0
  while half_rounded_up > 0
    new_arr[0] << arr[counter]
    half_rounded_up -= 1
    counter += 1
  end
  while counter < arr.count
    new_arr[1] << arr[counter]
    counter += 1
  end
  new_arr
end

halvsies([1, 2, 3, 4]) == [[1, 2], [3, 4]]
halvsies([1, 5, 2, 4, 3]) == [[1, 5, 2], [4, 3]]
halvsies([5]) == [[5], []]
halvsies([]) == [[], []]