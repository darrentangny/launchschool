def featured(num)
  loop do
    until num % 7 == 0
      num += 1
    end
    until num.odd?
      num += 7
    end
    if num.to_s.chars == num.to_s.chars.uniq
      return num
    end
  end
end

featured(12) == 21
featured(20) == 21
featured(21) == 35
featured(997) == 1029
featured(1029) == 1043
featured(999_999) == 1_023_547
featured(999_999_987) == 1_023_456_987

featured(9_999_999_999) # -> There is no possible number that fulfills those requirements