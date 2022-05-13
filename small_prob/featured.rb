def featured(num)
  loop do
    return "Error" if num > 9_999_999_999
    if num % 7 == 0
      num += 7
    else
      until num % 7 == 0
        num += 1
      end
    end
    until num.odd?
      num += 7
    end
    if num.to_s.chars == num.to_s.chars.uniq
      return num
    else
      num += 7
    end
  end
end

def featured(num)
  num += 1
  num += 1 until num.odd? && num % 7 == 0

  loop do
    num_chars = num.to_s.split('')
    return num if num_chars.uniq == num_chars
    num += 14
    break if num >= 9_876_543_210
  end

  'There is no possible number that fulfills those requirements.'
end

featured(12) == 21
featured(20) == 21
featured(21) == 35
featured(997) == 1029
featured(1029) == 1043
featured(999_999) == 1_023_547
featured(999_999_987) == 1_023_456_987

featured(9_999_999_999) # -> There is no possible number that fulfills those requirements