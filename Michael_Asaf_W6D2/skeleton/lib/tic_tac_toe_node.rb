require_relative 'tic_tac_toe'


class TicTacToeNode

  attr_reader :board, :next_mover_mark, :prev_move_pos
  
  
  def initialize(board, next_mover_mark, prev_move_pos = nil)
    @board = board
    @next_mover_mark = next_mover_mark
    @prev_move_pos = prev_move_pos
  end

  def losing_node?(evaluator)
    return true if @board.over? && (@board.winner != evaluator && !@board.winner.nil?)
    return false if @board.over? && (@board.winner == evaluator || @board.winner.nil?)
      
      if next_mover_mark == evaluator
        self.children.all? do |child|
          child.losing_node?(evaluator)
        end
      else  
        self.children.any? do |child|
          child.losing_node?(evaluator)
        end
      end
  end

  def winning_node?(evaluator)
    return true if @board.over? && @board.winner == evaluator
    return false if @board.over? && (@board.winner != evaluator || @board.winner.nil?)

    if next_mover_mark == evaluator
        self.children.any? do |child|
          child.winning_node?(evaluator)
        end
    else  
        self.children.all? do |child|
          child.winning_node?(evaluator)
        end
    end
  end

  # This method generates an array of all moves that can be made after
  # the current move.
  def children
    array = []
    (0..2).each do |row|
      (0..2).each do |col|
        pos = [row, col]
        if @board.empty?(pos)
          new_board = @board.dup
          new_board[pos] = next_mover_mark
          next_mark = ((next_mover_mark == :x) ? :o : :x)
          array << TicTacToeNode.new(new_board, next_mark, pos)          
        end
      end
    end
    array
  end
end
