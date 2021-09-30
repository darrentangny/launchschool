VALID_CHOICES = %w(rock paper scissors spock lizard)

def prompt(message)
  Kernel.puts("=> #{message}")
end

WINS =  { 'rock'      => ['scissors', 'lizard'],
          'paper'     => ['rock',     'spock'],
          'scissors'  => ['paper',    'lizard'],
          'spock'     => ['scissors', 'rock'],
          'lizard'    => ['paper',    'spock']
        }

def win?(first, second)
  WINS[first].include?(second)
end

def display_results(player, computer)
  if win?(player, computer)
    prompt("You won!")
  elsif win?(computer, player)
    prompt("Computer won!")
  else
    prompt("It's a tie!")
  end
end

def choice_unabbreviate(word)
  if word.downcase.start_with?('r')
    choice = 'rock'
  elsif word.downcase.start_with?('sc')
    choice = 'scissors'
  elsif word.downcase.start_with?('sp')
    choice = 'spock'
  elsif word.downcase.start_with?('p')
    choice = 'paper'
  elsif word.downcase.start_with?('l')
    choice = 'lizard'
  end
end

computer_score = 0
player_score = 0

loop do
  choice = ''

  loop do
    prompt("Choose one: #{VALID_CHOICES.join(', ')}")
    choice = Kernel.gets().chomp()
    choice = choice_unabbreviate(choice)

    if VALID_CHOICES.include?(choice)
      break
    else
      prompt("That's not a valid choice.")
    end
  end

  computer_choice = VALID_CHOICES.sample

  prompt("You chose: #{choice}; Computer chose #{computer_choice}")

  display_results(choice, computer_choice)

  if win?(choice, computer_choice)
    player_score += 1
  elsif win?(computer_choice, choice)
    computer_score += 1
  end

  puts "Player: #{player_score} Computer: #{computer_score}"

  if player_score == 3
    puts "Player wins match!"
    break
  elsif computer_score == 3
    puts "Computer wins match!"
    break
  end

  prompt("Do you want to play again?")
  answer = Kernel.gets().chomp()
  break unless answer.downcase().start_with?('y')
end

prompt("Thank you for playing. Good bye!")
