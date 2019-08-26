require "pry"
class TicTacToe
  def initialize
    @board = Array.new(9, " ")
  end

  WIN_COMBINATIONS = [
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,3,6],
    [1,4,7],
    [2,5,8],
    [0,4,8],
    [6,4,2]
  ]

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def input_to_index(user_input)
    user_input = user_input.to_i - 1
  end

  def move(index, token = "X")
    @board[index] = token
  end

  def position_taken?(index)
    @board[index] == "X" ||  @board[index] == "O" ? true : false
  end

  def valid_move?(position)
    if @board[position] == nil
      return false
    elsif position_taken?(position) == true
      return false
    else
      return true
    end
  end

  def turn_count
    count = @board.count("X") + @board.count("O")
    count
  end

  def current_player
    if @board.count("X") > @board.count("O")
       "O"
     elsif @board.count("X") == @board.count("O")
       "X"
     else
       "X"
     end
  end

  def turn
    puts "Please choose a position on the board from 1 to 9: "
    user_input = input_to_index(gets.chomp)
    if valid_move?(user_input)
      binding.pry
      move(user_input, current_player)
      display_board
    else
      turn
    end
  end
end
