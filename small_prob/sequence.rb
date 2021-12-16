def sequence(num)
  arr = []
  1.upto(num) { |i| arr << i }
  arr
end

sequence(5) == [1, 2, 3, 4, 5]
sequence(3) == [1, 2, 3]
sequence(1) == [1]

def sequence(num)
  (1..num).to_a
end