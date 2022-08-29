# Comment
# class Octal
#   attr_accessor :number
#   attr_reader :num_arr, :str

#   def initialize(str)
#     @num_arr = str.chars
#     @str = str
#     @number = num_arr.join.to_i
#   end

#   def to_decimal
#     return 0 if str.match?(/[a-zA-Z8-9]/)

#     get_total(num_arr.size - 1)
#   end

#   private

#   def get_total(steps)
#     total = 0
#     0.upto(steps) do |exp|
#       total +=  case number
#                 when 0...10 then number * (8**exp)
#                 else (number % 10) * (8**exp)
#                 end
#       self.number /= 10
#     end
#     total
#   end
# end

# LS
# class Octal
#   attr_reader :number

#   def initialize(str)
#     @number = str
#   end

#   def to_decimal
#     return 0 unless valid_octal?(number)

#     arr_digits = number.to_i.digits

#     new_number = 0
#     arr_digits.each_with_index do |num, exponent|
#       new_number += (num * (8**exponent))
#     end

#     new_number
#   end

#   private

#   def valid_octal?(num)
#     num.chars.all? { |n| n =~ /[0-7]/ }
#   end
# end

# Student1 (Best)
class Octal
  def initialize(oct)
    @oct = oct.match?(/[^0-7]/) ? 0 : oct
  end

  def to_decimal
    oct.to_i.digits.map.with_index { |n, i| 8**i * n }.sum
  end

  private

  attr_reader :oct
end
