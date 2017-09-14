class Board
  attr_reader :board, :board_score

  def initialize
    @board = [["1","2","3"],["4","5","6"],["7","8","9"]]
    @board_score = {"1" => 8,
                    "2" => 1,
                    "3" => 6,
                    "4" => 3,
                    "5" => 5,
                    "6" => 7,
                    "7" => 4,
                    "8" => 9,
                    "9" => 2}
  end

  def show
    @board.each{|row| puts row.inspect}
  end

  def mark(choice, character)
    @board[(choice-1) / 3][(choice % 3) - 1] = character
    self.show
  end

end

class Player
  attr_accessor :player_name, :player_character, :score_tally

  def initialize(order)
    @order = order
    @player_name = self.get_name
    @player_character = self.get_character
    @score_tally = 0

  end

  def get_name
    puts "Player #{@order}, what's your name?"
    player_name = gets.chomp
    puts "Hello #{player_name}"
    puts "\n\n"
    player_name
  end

  def get_character
    puts "#{@player_name}, what letter do you want to be?"
    player_character = gets.chomp
    puts "\n\n"
    player_character
  end

  def score
    @score_tally
  end

end

class Game

  def initialize
    @winner = false
    @p1move = true
    @move_count = 0
    @game_board = Board.new
    @p1 = Player.new(1)
    @p2 = Player.new(2)
    puts "Let's play tic-tac-toe!"
    @board = @game_board.board
    self.check_move
  end

  def check_move
    @p1move ? self.move(@p1) : self.move(@p2)
  end

  def move(player)
    @move_count += 1
    @p1move == true ? @p1move = false : @p1move = true
    puts "#{player.player_name}, it's your move."
    puts "Which space do you want?"
    @game_board.show
    choice = gets.chomp
    @game_board.mark(choice.to_i, player.player_character)
    player.score_tally += @game_board.board_score[choice]
    puts "\n\n"
    self.check_score
  end

  def check_score

    if (@p1.score_tally == 15 || @p2.score_tally == 15)
      puts "Win!"
    elsif @move_count < 9
      self.check_move
    else
      puts "Tie!"
    end
  end

end

g = Game.new