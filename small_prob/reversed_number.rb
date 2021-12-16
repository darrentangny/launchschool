def reversed_number(num)
  num.digits.join.to_i
end

reversed_number(12345) == 54321
reversed_number(12213) == 31221
reversed_number(456) == 654
reversed_number(12000) == 21 # No leading zeros in return value!
reversed_number(12003) == 30021
reversed_number(1) == 1

def reversed_number(num)
  str = num.to_s
  reversed_str = str.reverse
  reversed_str.to_i
end