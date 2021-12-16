def letter_percentages(str)
  lower_case = []
  upper_case = []
  neither = []

  str.chars.each do |char|
    if ('a'..'z').any?(char)
      lower_case << char
    elsif ('A'..'Z').any?(char)
      upper_case << char
    else
      neither << char
    end
  end
  
  hash = {}
  hash[:lowercase] = (lower_case.count / str.chars.count.to_f) * 100
  hash[:uppercase] = (upper_case.count / str.chars.count.to_f) * 100
  hash[:neither] = (neither.count / str.chars.count.to_f) * 100
  hash
end

letter_percentages('abCdef 123') == { lowercase: 50.0, uppercase: 10.0, neither: 40.0 }
letter_percentages('AbCd +Ef') == { lowercase: 37.5, uppercase: 37.5, neither: 25.0 }
letter_percentages('123') == { lowercase: 0.0, uppercase: 0.0, neither: 100.0 }