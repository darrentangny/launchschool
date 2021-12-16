def swapcase(str)
  result = str.chars.each do |char|
    if ('A'..'Z').include?(char)
      char.downcase!
    elsif ('a'..'z').include?(char)
      char.upcase!
    else
      next
    end
  end
  result.join
end

swapcase('CamelCase') == 'cAMELcASE'
swapcase('Tonight on XYZ-TV') == 'tONIGHT ON xyz-tv'

def swapcase(str)
  str.chars.map { |chr| chr.match?(/[A-Z]/) ? chr.downcase : chr.upcase }.join
end

