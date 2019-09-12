require_relative "singleton"
require_relative "piece"

class NullPiece 

 include Singleton
 
  def initialize()
    @color = :none
    @symbol = " "
  end

  def empty?
    true
  end
  
  def moves
    return []
  end

end