require 'pry-byebug'

class Player

end

class Board
  attr_reader :board_arr
  def initialize()
    @board_arr = Array.new(3,Array.new(3,nil))
  end
end
binding.pry
board = Board.new
p board