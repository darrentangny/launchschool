def interleave(arr1, arr2)
  counter = 0
  arr3_counter = 0
  arr3 = []
  until arr3_counter == (arr1.count) * 2 
    arr3[arr3_counter] = arr1[counter]
    arr3[arr3_counter + 1] = arr2[counter]
    counter += 1
    arr3_counter += 2
  end
  arr3
end

def interleave(arr1, arr2)
  arr1.zip(arr2).flatten
end


interleave([1, 2, 3], ['a', 'b', 'c']) == [1, 'a', 2, 'b', 3, 'c']

# LS method. Interesting use of double push
def interleave(arr1, arr2)
  result = []
  arr1.each_with_index do |element, index|
    result << element << arr2[index]
  end
  result
end

