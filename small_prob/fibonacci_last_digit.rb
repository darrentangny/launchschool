def fibonacci(num)
  f1 = 0
  f2 = 1
  counter = 1
  result = 0

  loop do
    break if counter == num
    result = f1 + f2
    f1 = f2
    f2 = result
    counter += 1
  end
  result
end

def fibonacci_last(num)
  fibonacci(num) % 10
end