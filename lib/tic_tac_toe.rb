class TicTacToe

  def initialize
    @board = [" "," "," "," "," "," "," "," "," "]
  end

  WIN_COMBINATIONS = [
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,3,6],
    [1,4,7],
    [2,5,8],
    [0,4,8],
    [2,4,6]
  ]
  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def input_to_index(input)
    return input.to_i - 1
  end

  def move(index, character)
    @board[index] = character
  end

  def position_taken?(index)
    return @board[index] != " "
  end

  def valid_move?(index)
    return index.between?(0, 8) && !position_taken?(index)
  end

  def turn
    puts "Enter a position 1 - 9"
    input = gets.chomp
    index = input_to_index(input)

    if valid_move?(index)
      move(index, current_player)
      puts display_board
    else
      turn(@board)
    end
  end

  def turn_count
    return @board.count{ |x| x != " " }
  end

  def current_player
    return turn_count % 2 == 0 ? "X" : "O"
  end

  def won?
    WIN_COMBINATIONS.each { |x|
      return x if x.all? { |y| @board[y] == "X" } || x.all? { |y| @board[y] == "O" }
    }
      return false
  end

  def full?
    return @board.all? { |x| x != " " }
  end

  def draw?
    return full? && !won? ? true : false
  end

  def over?
    return won? || draw? || full? ? true : false
  end

  def winner
    winning_combo = won?
    return !winning_combo ? nil : @board[winning_combo.first]
  end

  def play
    until over?
      turn
    end

    if won?
      puts "Congratulations #{winner}!"
    elsif draw?
      puts "Cat's Game!"
    end
  end
end
