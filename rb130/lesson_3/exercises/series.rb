# class Series
#   def initialize(num_str)
#     @numbers = num_str.chars.map(&:to_i)
#   end

#   def slices(num)
#     length = num.to_i - 1
#     raise ArgumentError if num.to_i > numbers.size
#     idx = 0
#     result = []
#     loop do
#       break if length == numbers.size
#       result << numbers[idx..length]
#       length += 1
#       idx += 1
#     end
#     result
#   end

#   private

#   attr_reader :numbers

# end

#LS
class Series
  attr_accessor :number_string

  def initialize(str)
    @number_string = str
  end

  def slices(length)
    raise ArgumentError.new if length > number_string.size
    number_string.chars.map(&:to_i).each_cons(length).to_a
  end
end