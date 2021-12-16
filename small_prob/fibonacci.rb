def digit_count(num)
  count = 0
  while num > 0
    num = num / 10
    count += 1
  end
  count
end

def find_fibonacci_index_by_length(num)
  fibonacci = [1, 1]
  loop do
    break if digit_count(fibonacci.last) == num
    fibonacci << fibonacci.last(2).sum
  end
  fibonacci.index(fibonacci.last) + 1
end



find_fibonacci_index_by_length(2) == 7          # 1 1 2 3 5 8 13
find_fibonacci_index_by_length(3) == 12         # 1 1 2 3 5 8 13 21 34 55 89 144
find_fibonacci_index_by_length(10) == 45
find_fibonacci_index_by_length(100) == 476
find_fibonacci_index_by_length(1000) == 4782
find_fibonacci_index_by_length(10000) == 47847