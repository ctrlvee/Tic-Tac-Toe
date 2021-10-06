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
    @arr = Array.new(3) { Array.new(3, "-") }
  end

  def make_move(p, row, col)

    if check_if_marker_exists(row, col)
      return 
    else
      @arr[row][col] = p.player_marker
    end
  end
  
  def check_if_marker_exists(row, col)
  
    if @arr[row][col] != '-'
      puts 'Invalid. The square has been used'
      true
    end
  end
end

def who_won?(p1, p2)
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
      if p1_count == 3
        return p1
      elsif p2_count == 3
        return p2
      else
        p1_count = 0
        p2_count = 0
      end
    return false
  end
end

def check_horizontal(b, p1, p2)
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
    return false
  end
end

def is_board_filled?(b)
  b.arr.each do |row|
    if row.include?("-")
      return false
    else
      return true
    end
  end
  raise NotFoundError
end 

def is_game_done?(b, p1, p2)
  if check_horizontal(b, p1, p2)
    return true
  elsif check_vertical(b, p1, p2)
    return true
  elsif is_board_filled?(b)
    return true
  else 
    return false
  #elsif check_diagonal(b, p1, p2)
    #return true
  end
end

def ask_moves(b, p1, p2)
  moves = 9
  until is_game_done?(b, p1, p2) == true
    if moves % 2 == 0
      puts ('Enter p2 coordinates')
      r = gets.to_i
      c = gets.to_i
      b.make_move(p2, r, c)
    else
      puts ('Enter p1 coordinates')
      r = gets.to_i
      c = gets.to_i
      b.make_move(p1, r, c)
    end
    print_board(b)
    moves -= 1
  end
end

def print_board(b)
  puts " ------\n"\
       "|#{b.arr[0][0]}|#{b.arr[0][1]}|#{b.arr[0][2]} |\n"\
       "|------|\n"\
       "|#{b.arr[1][0]}|#{b.arr[1][1]}|#{b.arr[1][2]} |\n"\
       "|------|\n"\
       "|#{b.arr[2][0]}|#{b.arr[2][1]}|#{b.arr[2][2]} |\n"\
       " ------"\
end

b = Board.new
p1 = Player.new
p2 = Player.new
binding.pry
ask_moves(b, p1, p2)
#b.make_move(p1, 1, 2)
#b.make_move(p1, 0, 0)
#b.make_move(p1, 1, 1)
#b.make_move(p2, 0, 0)
#b.make_move(p1, 1, 0)
#b.make_move(p1, 2, 0)
#print_board(b)
#check_vertical(b,p1,p2)
#check_horizontal(b,p1,p2)
#binding.pry
#is_board_filled?(b)