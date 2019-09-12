require_relative "piece"
require_relative "slideable"

class Queen < Piece
  include Slideable

 
  def move_dirs
     diagonal_dirs
  end

  def symbol
    return :B
  end
end