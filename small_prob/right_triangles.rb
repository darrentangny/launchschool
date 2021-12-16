def triangle(num)
  counter = num - 1
  loop do
    counter.times { |i| print " " }
    (num - counter).times { |i| print "*" }
    print "\n"
    counter -= 1
    break if counter < 0
  end
end

triangle(5)
triangle(9)

def triangle(num)
  spaces = num - 1
  stars = 1

  num.times do |n|
    puts (' ' * spaces) + ('*' * stars)
    spaces -= 1
    stars += 1
  end
end