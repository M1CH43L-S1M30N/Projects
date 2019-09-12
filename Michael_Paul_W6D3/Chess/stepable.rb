module Stepable

  STEP_DIRS = [
        [0, -1]
        [0, 1]
        [1, 0]
        [-1, 0]
      ]

  KNIGHT_DIRS = [
        [2, 1]
        [-1, -2]
        [-2, -1]
        [1, 2]
        [-1, 2]
        [1, -2]
        [-2, 1]
        [2, -1]  
  ]

  
  def step_dirs
    STEP_DIRS
  end

  def knight_dirs
    KNIGHT_DIRS
  end

  def moves
    directions = []
    move_dirs.each do |dx, dy|
      directions += move_dir_check(dx, dy)
    end
    directions
  end

  def move_dir_check(dx, dy)
    curr_x, curr_y = pos
      moves = []
        curr_x = curr_x + dx
        curr_y = curr_y + dy
        next_pos = [curr_x, curr_y]
        return moves if !board.valid_pos?(next_pos)
        piece = board[next_pos] 
        if piece.empty?
          moves << next_pos
        else
          moves << next_pos if piece.color != self.color
        end
      return moves
  end
end

