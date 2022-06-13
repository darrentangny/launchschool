# def compute
#   return "Does not compute" unless block_given?
#   yield
# end

def compute(arg)
  return "Does not compute" unless block_given?
  yield(arg)
end

compute('hi') { |word| puts word }
puts compute(1) { |num| 5 + num }
puts compute(100)