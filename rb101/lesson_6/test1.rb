def method(variable)
  other_method(variable)
end

def other_method(arg)
  arg.pop
end

array = [1,2,3]

method(array)

p array