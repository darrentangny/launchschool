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

def fibonacci_last(nth)
  last_2 = [1, 1]
  3.upto(nth) do
    last_2 = [last_2.last, (last_2.first + last_2.last) % 10]
  end

  last_2.last
end

def fibonacci_last_fast(n)
  fibonacci_repeating_sequence = determine_fibonacci_repeating_sequence
  index = (n - 1) % fibonacci_repeating_sequence.length
  fibonacci_repeating_sequence[index]
end

# Determine the repeated pattern in the fibonacci sequence
def determine_fibonacci_repeating_sequence
  last_digits = [1, 1]
  loop do
    next_last_digit = (last_digits[-2] + last_digits[-1]) % 10
# Personal note: might not work, seems to assume any output that matches the
# first two in sequence means the pattern repeats. Assume it would help only if
# one knew something about the fibonacci pattern.
    # If this condition is met, we know that the pattern will begin repeating
    if last_digits[-1] == last_digits[0] && next_last_digit == last_digits[1]
      return last_digits[0..-2]
    else
      last_digits << next_last_digit
    end
  end
end