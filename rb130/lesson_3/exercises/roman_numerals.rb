# class RomanNumeral
#   attr_reader :num

#   def initialize(num)
#     @num = num
#   end

#   def to_roman
#     place_array = [method(:ones_place), method(:tens_place),
#       method(:hundreds_place), method(:thousands_place)]
#     var = num
#     str = ''
    
#     0.upto(num.to_s.chars.size - 1) do |idx|
#       method = place_array[idx]
#       str.prepend(method.call(var % 10))
#       var /= 10
#     end
#     str
#   end

#   private

#   def ones_place(num)
#     conversion = { 0 => '', 1 => 'I', 2 => 'II', 3 => 'III', 4 => 'IV',
#       5 => 'V', 6 => 'VI', 7 => 'VII', 8 => 'VIII', 9 => 'IX' }
#     conversion[num]
#   end

#   def tens_place(num)
#     conversion = { 0 => '', 1 => 'X', 2 => 'XX', 3 => 'XXX', 4 => 'XL', 
#       5 => 'L', 6 => 'LX', 7 => 'LXX', 8 => 'LXXX', 9 => 'XC' }
#     conversion[num]
#   end

#   def hundreds_place(num)
#     conversion = { 0 => '', 1 => 'C', 2 => 'CC', 3 => 'CCC', 4 => 'CD', 
#       5 => 'D', 6 => 'DC', 7 => 'DCC', 8 => 'DCCC', 9 => 'CM' }
#     conversion[num]
#   end

#   def thousands_place(num)
#     conversion = { 0 => '', 1 => 'M', 2 => 'MM', 3 => 'MMM' }
#     conversion[num]
#   end
# end

class RomanNumeral
  attr_accessor :number

  ROMAN_NUMERALS = {
    "M" => 1000,
    "CM" => 900,
    "D" => 500,
    "CD" => 400,
    "C" => 100,
    "XC" => 90,
    "L" => 50,
    "XL" => 40,
    "X" => 10,
    "IX" => 9,
    "V" => 5,
    "IV" => 4,
    "I" => 1
  }

  def initialize(number)
    @number = number
  end

  def to_roman
    roman_version = ''
    to_convert = number

    ROMAN_NUMERALS.each do |key, value|
      multiplier, remainder = to_convert.divmod(value)
      if multiplier > 0
        roman_version += key * multiplier
      end
      to_convert = remainder
    end
    roman_version
  end
end