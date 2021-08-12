require 'pry-byebug'

class Player
  attr_reader :player_marker

  @@markers = %w[X O].shuffle
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



def check_vertical
  p1_count = 0
  p2_count = 0
 
  3.times do |col|
    3.times do |row|
      case $arr[row][col]
      when @p1.player_marker
        p1_count += 1
      when @p2.player_marker
        p2_count += 1
      end
    end
  end
  p1_count
end


binding.pry
Board.new

@p1 = Player.new
@p2 = Player.new

@p1.make_move(1, 1)
@p1.make_move(1, 2)
@p1.make_move(1, 0)
check_vertical()
#@p2.make_move(1,2)