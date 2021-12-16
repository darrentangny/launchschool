def negative(num)
  if num <= 0
    num
  else
    num - (num * 2)
  end
end

negative(5) == -5
negative(-3) == -3
negative(0) == 0      # There's no such thing as -0 in ruby

def negative(num)
  num <= 0 ? num : num - (num * 2)
end

def negative(num)
  num > 0 ? -num : num
end