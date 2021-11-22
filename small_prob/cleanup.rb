def cleanup(str)
  arr = str.chars.map! { |char| ('a'..'z').include?(char) ? char : ' ' }
  arr.join.squeeze(' ')
end

cleanup("---what's my +*& line?") == ' what s my line '