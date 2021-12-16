def multiply_list(arr1, arr2)
  arr1.map.with_index do |num, idx|
    num * arr2[idx]
  end
end

multiply_list([3, 5, 7], [9, 10, 11])