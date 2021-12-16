def balanced?(str)
  parentheses_count = { left: 0, right: 0 }
  str.chars.each do |char|
    case char
    when ')'
      return false if parentheses_count[:right] <= parentheses_count[:left]
      parentheses_count[:left] += 1
    when '('
      return false if parentheses_count[:left] > parentheses_count[:right]
      parentheses_count[:right] += 1
    end
  end
  parentheses_count[:left] == parentheses_count[:right]
end

def balanced?(str)
  parentheses_count = 0
  str.chars.each do |char|
    case char
    when '('
      parentheses_count += 1
    when ')'
      return false if parentheses_count == 0
      parentheses_count -= 1
    end
  end
  parentheses_count == 0
end

def balanced?(str)
  parens = 0
  str.each_char do |char|
    parens += 1 if char == '('
    parens -= 1 if char == ')'
    return false if parens < 0
  end
  parens.zero?
end

balanced?('What (is) this?') == true
balanced?('What is) this?') == false
balanced?('What (is this?') == false
balanced?('((What) (is this))?') == true
balanced?('((What)) (is this))?') == false
balanced?('Hey!') == true
balanced?(')Hey!(') == false
balanced?('What ((is))) up(') == false