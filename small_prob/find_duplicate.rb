# faster, more efficient method
def find_dup(arr)
  hash = {}
  answer = 0
  arr.each do |element|
    if hash.key?(element)
      answer = element
      break
    else
      hash.store(element, 1)
    end
  end
  answer
end


find_dup([1, 5, 3, 3]) == 1

# launch school brute force method
def find_dup(arr)
  arr.find { |element| array.count(element) == 2 }
end

uniq => [1] 

# go through the array once
# check if current element is in hash map
# if in hash map return element thats your duplicate
# each element put into hash map


