class GuessingGame
  def initialize
    @num = rand 1..100
    @guess = nil
    @guesses_remaining = 7
  end

  def play
    loop do
      disp_guesses_remaining
      prompt_for_number
      disp_result
      break if @guesses_remaining == 0 || win?
    end
    if win?
      puts "You won!"
    else
      puts "You have no more guesses. You lost!"
    end
  end

  private

  def disp_guesses_remaining
    puts "You have #{@guesses_remaining} guesses remaining"
  end

  def prompt_for_number
    puts "Enter a number between 1 and 100:"
    loop do
      @answer = gets.chomp
      if @answer.split.any?(/[^0-9]/)
        puts "Please enter a number only: "
      elsif @answer.to_i < 1 || @answer.to_i > 100
        puts "Please enter a number between 1 and 100: "
      else
        @answer = @answer.to_i
        break
      end
    end
  end

  def disp_result
    if @answer == @num
      puts "That's the number!\n\n"
    elsif @answer < @num
      puts "Your guess is too low"
      @guesses_remaining -= 1
    else
      puts "Your guess is too high"
      @guesses_remaining -= 1
    end
  end

  def win?
    @answer == @num
  end
end

GuessingGame.new.play
