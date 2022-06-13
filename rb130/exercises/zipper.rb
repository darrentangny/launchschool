def zipper(arr1, arr2)
  result = []
  0.upto(arr1.size - 1) do |idx|
    result << [arr1[idx], arr2[idx]]
  end
  result
end

def zipper(array1, array2)
  result = []
  array1.each_with_index do |element, index|
    result << [element, array2[index]]
  end
  result
end

def zipper(array1, array2)
  array1.each_with_index.with_object([]) do |(element, index), result|
    result << [element, array2[index]]
  end
end

zipper([1, 2, 3], [4, 5, 6]) == [[1, 4], [2, 5], [3, 6]]
