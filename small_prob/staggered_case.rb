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

staggered_case('I Love Launch School!') == 'I LoVe lAuNcH ScHoOl!'
staggered_case('ALL_CAPS') == 'AlL_CaPs'
staggered_case('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 NuMbErS'