# def print_in_box(str)
#   width = str.length + 2
#   print "+"
#   width.times { |_| print "-" }
#   puts "+"
#   print "|"
#   width.times { |_| print " " }
#   puts "|"
#   print "|"
#   print " #{str} "
#   puts "|"
#   print "|"
#   width.times { |_| print " " }
#   puts "|"
#   print "+"
#   width.times { |_| print "-" }
#   puts "+"
# end

def print_in_box(message)
  horizontal_rule = "+#{'-' * (message.size + 2)}+"
  empty_line = "|#{' ' * (message.size + 2)}|"

  puts horizontal_rule
  puts empty_line
  puts "| #{message} |"
  puts empty_line
  puts horizontal_rule
end

print_in_box('')
print_in_box('To boldly go where no one has gone before.')
