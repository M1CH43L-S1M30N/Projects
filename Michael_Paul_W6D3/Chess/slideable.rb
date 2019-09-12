module Slideable
      DIAGONAL_DIRS = [
      [1, 1]
      [-1, 1]
      [1, -1]
      [-1, -1]

    ]

       HORIZONTAL_DIRS = [
          [1, 0]
          [-1, 0]
      ]

      VERTICAL_DIRS = [
          [0, 1]
          [0, -1]
        ]
  def diagonal_dirs
    DIAGONAL_DIRS
  end

  def vertical_dirs
      VERTICAL_DIRS
  end

  def horizontal_dirs
    HORIZONTAL_DIRS
  end

  def moves
    directions = []
    move_dirs.each do |dx, dy| 
      directions += grow_unblocked_moves_in_dir(dx, dy)
    end
    directions
  end
  
  def grow_unblocked_moves_in_dir(dx, dy)
      curr_x, curr_y = pos
      moves = []
      loop do
        curr_x = curr_x + dx
        curr_y = curr_y + dy
        next_pos = [curr_x, curr_y]
        break if !board.valid_pos?(next_pos)
        piece = board[next_pos] 
        if piece.empty?
          moves << next_pos
        else
          moves << next_pos if piece.color != self.color
          break
        end
      end
      return moves
  end
end