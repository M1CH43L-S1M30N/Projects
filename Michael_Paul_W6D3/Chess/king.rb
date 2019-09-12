require_relative "piece"
require_relative "stepable"

class King < Piece
  include Stepable

 
  def move_dirs
     diagonal_dirs + vertical_dirs + horizontal_dirs
  end

  def symbol
    return :K
  end
end