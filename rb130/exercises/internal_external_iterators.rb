factorial_enum = Enumerator.new do |yielder|
  a = 1
  counter = 0
  yielder << a
  loop do
    counter += 1
    a *= counter
    yielder << a
  end
end

# LS Solution

factorial = Enumerator.new do |yielder|
  accumulator = 1
  number = 0
  loop do
    accumulator = number.zero? ? 1 : accumulator * number
    yielder << accumulator
    number += 1
  end
end

# p factorial_enum.take(7)
# p factorial_enum.take(3)

# puts factorial_enum.next
# puts factorial_enum.next
# puts factorial_enum.next
# puts factorial_enum.rewind
# puts factorial_enum.next

6.times { |number| puts "#{number}! == #{factorial_enum.next}" }
puts "========================="
6.times { |number| puts "#{number}! == #{factorial_enum.next}" }
puts "========================="
factorial_enum.rewind
6.times { |number| puts "#{number}! == #{factorial_enum.next}" }
puts "========================="

factorial_enum.each_with_index do |value, number|
  puts "#{number}! == #{value}"
  break if number >= 5
end