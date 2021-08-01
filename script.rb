require 'pry-byebug'

class Player
  attr_reader :player_marker
  @@markers = ["X","O"].shuffle
  @@player_count = 1

  def initialize
    @player_name = "Player #{@@player_count}"
    @player_marker = @@markers.pop 
    @@player_count += 1
  end
  
end

class Board
  attr_reader :arr
  def initialize()
    #@arr = Array.new(3,Array.new(3,nil))
    @arr = Array.new(3) {Array.new(3,nil)}
  end
end

binding.pry
board = Board.new
p1 = Player.new
p2 = Player.new
