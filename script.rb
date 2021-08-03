require 'pry-byebug'

class Player
  attr_reader :player_marker

  @@markers = %W[X O].shuffle
  @@player_count = 1

  def initialize
    @player_name = "Player #{@@player_count}"
    @player_marker = @@markers.pop 
    @@player_count += 1
  end
  
  def make_move(row, col)
    
    if check_if_marker_exists(row,col)
      return 
    else
      $arr[row][col] = player_marker
    end
  end

  def check_if_marker_exists(row, col)

    if $arr[row][col] != nil
      puts 'Invalid. The other player has used that square'
      true
    end

  end
end

class Board
  def initialize
    $arr = Array.new(3) { Array.new(3, nil) }
  end
end

class Game
  
  def initialize
    Board.new
  end
end

binding.pry

p1 = Player.new
p2 = Player.new

p1.make_move(1, 1)
