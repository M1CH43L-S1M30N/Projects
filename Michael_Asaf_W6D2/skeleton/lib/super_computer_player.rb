require_relative 'tic_tac_toe_node'
require "byebug"

class SuperComputerPlayer < ComputerPlayer
  def move(game, mark)
    node = TicTacToeNode.new(game.board, mark)
    child_array = node.children
    child_array.each do |child|
      if child.winning_node?(mark)
        return child.prev_move_pos
      end
    end
    child_array.each do |child|
      if !child.losing_node?(mark)
        return child.prev_move_pos
      end
    end 
    raise "You lost"
  end
end

if __FILE__ == $PROGRAM_NAME
  puts "Play the brilliant computer!"
  hp = HumanPlayer.new("Jeff")
  cp = SuperComputerPlayer.new

  TicTacToe.new(hp, cp).run
end
