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
end

class Board
  attr_accessor :arr

  def initialize
    @arr = Array.new(3) { Array.new(3, nil) }
  end

  def make_move(p, row, col)

    if check_if_marker_exists(row, col)
      return 
    else
      @arr[row][col] = p.player_marker
    end
  end
  
  def check_if_marker_exists(row, col)
  
    if @arr[row][col] != nil
      puts 'Invalid. The other player has used that square'
      true
    end
  end
end

def whoWon?(p1, p2)
  if p1 == 3
    return player_one
  elsif p2 == 3
    return player_two
  end
end

def reset_count 
  @p1_count = 0
  @p2_count = 0
end

def check_vertical(b,p1,p2)
  p1_count = 0
  p2_count = 0
  3.times do |col|
    3.times do |row|
      case b.arr[row][col]
      when p1.player_marker
        p1_count += 1
      when p2.player_marker
        p2_count += 1
      end
    end
    p1_count = 0
    p2_count = 0
  end
end

def check_horizontal(b,p1,p2)
  p1_count = 0
  p2_count = 0
  3.times do |row|
    3.times do |col|
      case b.arr[row][col]
      when p1.player_marker
        p1_count += 1
      when p2.player_marker
        p2_count += 1
      end
    end
    if p1_count == 3
      return p1
    elsif p2_count == 3
      return p2
    else
      p1_count = 0
      p2_count = 0
    end
  end
end

#def one_round

binding.pry
b = Board.new

p1 = Player.new
p2 = Player.new

b.make_move(p1,1,2)
b.make_move(p1,0,0)
b.make_move(p1,1,1)
b.make_move(p2,0,0)
b.make_move(p1,1,0)
b.make_move(p1,2,0)
p b.arr
#check_vertical(b,p1,p2)
check_horizontal(b,p1,p2)
