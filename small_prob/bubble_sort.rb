def bubble_sort!(arr)
  tally = 1
  loop do
    break if tally == 0
    tally = 0
    index = 0
    loop do
      break if index == arr.size - 1
      if arr[index + 1] < arr[index]
        arr[index], arr[index + 1] = arr[index + 1], arr[index]
        tally += 1
      end
      index += 1
    end
  end
  arr
end

def bubble_sort!(array)
  loop do
    swapped = false
    1.upto(array.size - 1) do |index|
      next if array[index - 1] <= array[index]
      array[index - 1], array[index] = array[index], array[index - 1]
      swapped = true
    end

    break unless swapped
  end
end

arr = [5,3]
bubble_sort!(arr)

array = %w(Sue Pete Alice Tyler Rachel Kim Bonnie)
bubble_sort!(array)
array == %w(Alice Bonnie Kim Pete Rachel Sue Tyler)