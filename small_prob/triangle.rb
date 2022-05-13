def triangle(a, b, c)
  arr = [a, b, c].sort
  if a == b && b == c
    :equilateral
  elsif a == b || b == c || a == c
    if sum_greater?(a, b, c)
      :isosceles
    else
      :invalid
    end
  elsif sum_greater?(a, b, c) && a[0] != 0
    :scalene
  else
    :invalid
  end
end    

def sum_greater?(d, e, f)
  arr = [d, e, f].sort
  arr[0] + arr[1] > arr[2]
end

# def triangle(side1, side2, side3)
#   sides = [side1, side2, side3]
#   largest_side = sides.max

#   case
#   when 2 * largest_side > sides.reduce(:+), sides.include?(0)
#     :invalid
#   when side1 == side2 && side2 == side3
#     :equilateral
#   when side1 == side2 || side1 == side3 || side2 == side3
#     :isosceles
#   else
#     :scalene
#   end
# end


triangle(3, 3, 3) == :equilateral
triangle(3, 3, 1.5) == :isosceles
triangle(3, 4, 5) == :scalene
triangle(0, 3, 3) == :invalid
triangle(3, 1, 1) == :invalid

