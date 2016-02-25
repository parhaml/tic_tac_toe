
class Game

  attr_accessor :board
  def initialize
    @board = Board.new
  end

  def show
    board.show
  end

  def mark(choice)
    board.mark(choice)
  end
end

class Board
  attr_accessor :game_board

  def initialize
    @game_board = [[1, 2, 3],
                   [4, 5, 6],
                   [7, 8, 9]
                  ]
  end

  def show
    puts "\n\n"
    game_board.each {|row| puts row.inspect}
  end

  def mark(choice)
    game_board[(choice-1) / 3][(choice % 3) - 1] = "X"
    self.show
  end
end


game = Game.new

