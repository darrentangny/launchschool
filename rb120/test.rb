require 'pry'

class Board
  attr_reader :squares
  WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] + # rows
                  [[1, 4, 7], [2, 5, 8], [3, 6, 9]] + # cols
                  [[1, 5, 9], [3, 5, 7]]              # diagonals

  def initialize
    @squares = {}
    reset
  end

  def []=(num, marker)
    @squares[num].marker = marker
  end

  def unmarked_keys
    @squares.keys.select { |key| @squares[key].unmarked? }
  end

  def full?
    unmarked_keys.empty?
  end

  def someone_won?
    !!winning_marker
  end

  def winning_marker
    WINNING_LINES.each do |line|
      squares = @squares.values_at(*line)
      if three_identical_markers?(squares)
        return squares.first.marker
      end
    end
    nil
  end

  def reset
    (1..9).each { |key| @squares[key] = Square.new }
  end

  def moves(human_marker, comp_marker)
    WINNING_LINES.each do |line|
      squares = @squares.values_at(*line)
      # binding.pry
      if !squares.any?(&:unmarked?)
        nil
      elsif two_comp_markers?(squares, comp_marker)
        return [line[winning_comp_marker(squares)]]
      elsif two_human_markers?(squares, human_marker)
        return [line[stop_human_markers(squares)]]
      else
        nil
      end
    end
    return []
  end

  # rubocop:disable Metrics/AbcSize
  # rubocop:disable Metrics/MethodLength
  def draw
    puts "     |     |"
    puts "  #{@squares[1]}  |  #{@squares[2]}  |  #{@squares[3]}"
    puts "     |     |"
    puts "-----+-----+-----"
    puts "     |     |"
    puts "  #{@squares[4]}  |  #{@squares[5]}  |  #{@squares[6]}"
    puts "     |     |"
    puts "-----+-----+-----"
    puts "     |     |"
    puts "  #{@squares[7]}  |  #{@squares[8]}  |  #{@squares[9]}"
    puts "     |     |"
  end
  # rubocop:enable Metrics/AbcSize
  # rubocop:enable Metrics/MethodLength

  private

  def three_identical_markers?(squares)
    markers = squares.select(&:marked?).collect(&:marker)
    return false if markers.size != 3
    markers.min == markers.max
  end

  def two_comp_markers?(squares, comp_marker)
    markers = squares.map(&:marker).select do |elem|
      elem == comp_marker
    end
    # binding.pry
    return false if markers.size != 2
    markers.min == markers.max
  end

  def winning_comp_marker(squares)
    winner = squares.map(&:marker).index { |element| element == ' ' }
    winner
  end

  def two_human_markers?(squares, human_marker)
    markers = squares.map(&:marker).select do |elem|
      elem == human_marker
    end
    return false if markers.size != 2
    markers.min == markers.max
  end

  def stop_human_markers(squares)
    stopper = squares.map(&:marker).index { |element| element == ' ' }
    stopper
  end
end

class Square
  INITIAL_MARKER = " "

  attr_accessor :marker

  def initialize(marker=INITIAL_MARKER)
    @marker = marker
  end

  def to_s
    @marker
  end

  def unmarked?
    marker == INITIAL_MARKER
  end

  def marked?
    marker != INITIAL_MARKER
  end
end

class Player
  attr_accessor :score, :marker, :name

  def initialize(marker)
    @marker = marker
    @score = 0
    @name = ['Bob', 'Joe', 'Cal'].sample
  end

  def add_score_point
    @score += 1
  end
end

class TTTGame
  HUMAN_MARKER = "X"
  COMPUTER_MARKER = "O"
  FIRST_TO_MOVE = HUMAN_MARKER

  attr_reader :board, :human, :computer

  def initialize
    @board = Board.new
    @human = Player.new(HUMAN_MARKER)
    @computer = Player.new(COMPUTER_MARKER)
    @current_marker = FIRST_TO_MOVE
  end

  def play
    clear
    display_welcome_message
    choose_name
    main_game
    display_goodbye_message
  end

  private

  def choose_name
    puts "Enter your name: "
    answer = gets.chomp
    loop do
      break if answer.empty? == false
      puts "Please enter your name: "
      answer = gets.chomp
    end
    human.name = answer
  end

  def player_move
    loop do
      current_player_moves
      break if board.someone_won? || board.full?
      clear_screen_and_display_board if human_turn?
    end
  end

  def main_game
    loop do
      display_board
      choose_marker
      player_order
      print_player_order
      player_move
      display_result
      break unless score_check
      break unless play_again?
      reset
      display_play_again_message
    end
  end

  def player_order
    puts "Would you like to go first (1) or second (2)?"
    answer = ''
    loop do
      answer = gets.chomp
      if answer.to_i == 1 || answer.to_i == 2
        break
      else
        puts "Please enter 1 or 2"
      end
    end
    answer == '1' ? @current_marker = human.marker : @current_marker = \
      computer.marker
  end

  def print_player_order
    if @current_marker == HUMAN_MARKER
      puts "You will go first"
    else
      puts "Computer will go first"
    end
  end

  def choose_marker
    puts "Please select X (1) or O (2)"
    answer = ''
    loop do
      answer = gets.chomp
      break if answer.to_i == 1 || answer.to_i == 2
      puts "Please enter 1 for X or 2 for O"
    end
    if answer.to_i == 1
      puts "You are X. Computer is O"
      human.marker = 'X'
      computer.marker = 'O'
    else
      human.marker = 'O'
      computer.marker = 'X'
      puts "You are O. Computer is X"
    end
  end

  def display_welcome_message
    puts "Welcome to Tic Tac Toe!"
    puts ""
  end

  def display_goodbye_message
    puts "Thanks for playing Tic Tac Toe! Goodbye!"
  end

  def clear_screen_and_display_board
    clear
    display_board
  end

  def human_turn?
    @current_marker == human.marker
  end

  def display_board
    puts "You're a #{human.marker}. Computer is a #{computer.marker}."
    puts ""
    board.draw
    puts ""
  end

  def human_moves
    puts "Choose a square (#{joinor(board.unmarked_keys)}): "
    square = nil
    loop do
      square = gets.chomp.to_i
      break if board.unmarked_keys.include?(square)
      puts "Sorry, that's not a valid choice."
    end

    board[square] = human.marker
  end

  def computer_moves
    move = board.moves(HUMAN_MARKER, COMPUTER_MARKER)
    if move.empty? == false
      board[move[0]] = computer.marker
    else
      board[board.unmarked_keys.sample] = computer.marker
    end
  end

  def current_player_moves
    if human_turn?
      human_moves
      @current_marker = computer.marker
    else
      computer_moves
      @current_marker = human.marker
    end
  end

  def display_result
    clear_screen_and_display_board

    case board.winning_marker
    when human.marker
      puts "#{human.name} won!"
      human.add_score_point
    when computer.marker
      puts "#{computer.name} won!"
      computer.add_score_point
    else
      puts "It's a tie!"
    end

    puts "Player score: #{human.score}"
    puts "Computer score: #{computer.score}"
  end

  def score_check
    if human.score == 5
      puts "#{human.name} wins!"
    elsif computer.score == 5
      puts "#{computer.name} wins!"
    else
      true
    end
  end

  def play_again?
    answer = nil
    loop do
      puts "Would you like to play again? (y/n)"
      answer = gets.chomp.downcase
      break if %w(y n).include? answer
      puts "Sorry, must be y or n"
    end

    answer == 'y'
  end

  def clear
    system "clear"
  end

  def reset
    board.reset
    @current_marker = FIRST_TO_MOVE
    clear
  end

  def display_play_again_message
    puts "Let's play again!"
    puts ""
  end

  def joinor(arr, delimiter=', ', word='or')
    case arr.size
    when 0 then ''
    when 1 then arr.first
    when 2 then arr.join(" #{word} ")
    else
      arr[-1] = "#{word} #{arr.last}"
      arr.join(delimiter)
    end
  end
end

game = TTTGame.new
game.play
