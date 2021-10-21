player = 0
hashMap = Hash.new

def whatever(player, testing)
  p player
  testing["key"] = "value"
  puts "answer please"
  answer = gets.chomp
  case answer
  when 'y'
    puts 'yay'
    player = 1
    p player
    return player
  else
    puts 'nay'
  end
end

newPlayer = whatever(player, hashMap)
p(player)
p newPlayer
p hashMap.keys
#p testing