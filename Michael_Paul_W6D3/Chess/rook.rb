require_relative "piece"
require_relative "slideable"

class Queen < Piece
  include Slideable

 
  def move_dirs
     vertical_dirs + horizontal_dirs
  end

  def symbol
    return :R
  end
end