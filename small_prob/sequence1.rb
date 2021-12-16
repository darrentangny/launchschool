def sequence(count, first_num)
  result = []
  counter = 1
  until counter == count + 1 || counter == 0
    result << first_num * counter
    counter += 1
  end
  result
end

sequence(5, 1) == [1, 2, 3, 4, 5]
sequence(4, -7) == [-7, -14, -21, -28]
sequence(3, 0) == [0, 0, 0]
sequence(0, 1000000) == []

def sequence(count, first)
  sequence = []
  number = first

  count.times do
    sequence << number
    number += first
  end

  sequence
end

def sequence(count, first)
  (1..count).map { |value| value * first }
end