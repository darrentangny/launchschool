def minilang(str)
  stack = []
  register = 0
  str.split.each do |input|
    case input.downcase
    when 'push'
      stack << register
    when 'add'
      register += stack.pop
    when 'sub'
      register -= stack.pop
    when 'mult'
      register *= stack.pop
    when 'div'
      register /= stack.pop
    when 'mod'
      register %= stack.pop
    when 'pop'
      register = stack.pop
    when 'print'
      puts register
    else
      register = input.to_i
    end
  end
end

minilang('print')