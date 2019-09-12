require_relative "piece"
require_relative "nullpiece"
class Board
  attr_reader :grid
    def initialize
        @grid = Array.new(8) {Array.new(8)}
        @sentinel = NullPiece.new
    end

    def move_piece(start_pos, end_pos)
       raise "No piece at that position" if self[start_pos] == (@sentinel)
       raise "Invalid move" if self[end_pos] != (@sentinel)
       self[end_pos] = self[start_pos]
       self[start_pos] = @sentinel

    end

    def [](pos)
        row, col = pos
        @grid[row][col]
    end

    def []=(pos, value)
      row, col = pos
      @grid[row][col] = value
    end

    def valid_pos?(pos)
        return false if pos.sum > 14 || pos.sum < 0
        true
    end

    def add_piece(piece, pos)
      @grid[pos] = piece
    end

    def checkmate? #checkmate approach
      
    end

    def in_check?(color)
      enemy_pieces = []
      self.pieces.each do |piece|
        enemy_pieces << piece if piece.color != color
      end
      
      enemy_moves = []
      enemy_pieces.each do |enemy|
        enemy_moves << enemy.moves
      end
      
      if enemy_moves.include?(find_king(color))
        return true
      end
      false
      
    end

    def find_king(color) 
        @grid.each do |row|
            row.each do |col| 
                pos = [row, col]
               return pos if self[pos].is_a?(King) && self[pos].color
            end 
        end
    end

    def pieces 
      pieces_left = []
      @grid.each do |row|
        row.each do |col|
         if !@grid[row][col].is_a?(NullPiece)
          pieces_left << @grid[row][col]
         end
        end
      end
      pieces_left
    end

    def dup #not sure about dup
      self.dup
    end

    # def move_piece!(color, start_pos, end_pos)
    #   move_piece(color, start_pos, end_pos)
    # end

    def populate
      back_row = @grid[0]
      back_row[0] == Rook.new(red, board, [0, 0])
      back_row[7] == Rook.new(red, board, [0, 7])
      back_row[1] == Knight.new(red, board, [0, 1])
      back_row[6] == Knight.new(red, board, [0, 6])
      back_row[2] == Bishop.new(red, board, [0, 2])
      back_row[5] == Bishop.new(red, board, [0, 5])
      back_row[3] == King.new(red, board, [0, 3])
      back_row[4] == Queen.new(red, board, [0, 4])

      front_row = @grid[7]
      front_row[0] == Rook.new(black, board, [7, 7])
      back_row[7] == Rook.new(black, board, [7, 0])
      back_row[1] == Knight.new(black, board, [7, 1])
      back_row[6] == Knight.new(black, board, [7, 6])
      back_row[2] == Bishop.new(black, board, [7, 2])
      back_row[5] == Bishop.new(black, board, [7, 5])
      back_row[3] == King.new(black, board, [7, 3])
      back_row[4] == Queen.new(black, board, [7, 4])

      back_pawns == @grid[1]
      back_pawns.each_with_index { |space, i| space = Pawn.new(red, board, [1, i] ) }
      
      front_pawns == @grid[6]
      front_pawns.each_with_index { |space, i| space = Pawn.new(black, board, [6, i] ) }
    end

    

end

board = Board.new
p board.grid[7, 7]
