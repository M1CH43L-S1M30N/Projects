require_relative "piece"
require_relative "stepable"

class Knight < Piece
  include Stepable

 
  def move_dirs
     knight_dirs
  end

  def symbol
    return :N
  end
end