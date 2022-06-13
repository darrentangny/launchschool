# class Triangle
#   attr_reader :a, :b, :c

#   def initialize(a, b, c)
#     @a, @b, @c = a, b, c

#   end

#   def kind
#     if a == 0 || b == 0 || c == 0
#       raise ArgumentError, 'No size is illegal'
#     elsif a == b && b == c
#       'equilateral'
#     elsif a + b < c || b + c < a || a + c < b
#       raise ArgumentError, 'Size inequality is illegal'
#     elsif a == b || b == c || a == c
#       'isoceles'
#     else
#       'scalene'
#     end
#   end
# end

class Triangle
  attr_reader :sides

  def initialize(side1, side2, side3)
    @sides = [side1, side2, side3]
    raise ArgumentError.new "Invalid triangle lengths" unless valid?
  end

  def kind
    if sides.uniq.size == 1
      'equilateral'
    elsif sides.uniq.size == 2
      'isosceles'
    else
      'scalene'
    end
  end

  private

  def valid?
    sides.min > 0 &&
    sides[0] + sides[1] > sides[2] &&
    sides[1] + sides[2] > sides[0] &&
    sides[0] + sides[2] > sides[1]
  end
end