require 'pry-byebug'

$arr = Array.new(3) { Array.new(3,nil) }

class Player
  attr_reader :player_marker

  @@markers = ["X", "O"].shuffle
  @@player_count = 1

  def initialize
    @player_name = "Player #{@@player_count}"
    @player_marker = @@markers.pop 
    @@player_count += 1
  end
  
  def make_move(row, col)
    $arr[row][col] = player_marker
  end
end

binding.pry
p1 = Player.new
p2 = Player.new

p1.make_move(1, 1)
