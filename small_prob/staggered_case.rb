def staggered_case(str)
  str_arr = str.chars.map_with_index do |char, idx|
    if idx.even?
      char.upcase
    else
      char.downcase
    end
  end
  str_arr.join
end

def staggered_case(str)
  condition = true
  str_arr = str.chars.map do |char|
    if condition == true && char =~ /[a-z]/i
      condition = !condition
      char.upcase
    elsif condition == false && char =~ /[a-z]/i
      condition = !condition
      char.downcase
    else
      char
    end
  end
  str_arr.join
end

staggered_case('I Love Launch School!') == 'I lOvE lAuNcH sChOoL!'
staggered_case('ALL CAPS') == 'AlL cApS'
staggered_case('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 nUmBeRs'