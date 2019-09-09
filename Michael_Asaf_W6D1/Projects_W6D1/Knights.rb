class KnightPathFinder

    attr_reader :start_position, :root_node

  def self.valid_moves(pos)
    moves = [ 
        [2, -1], 
        [-2, -1], 
        [2, 1], 
        [-2, 1], 
        [-1, 2],
        [-1, -2],
        [1, -2],
        [1, 2]
    ]
    array = []
    moves.each do |move|
        delta_x = move[0]
        delta_y = move[1]
        new_x = pos[0] + delta_x
        new_y = pos[1] + delta_y
        if new_x < 8 && new_x >= 0 && new_y < 8 && new_y >= 0
            array << [new_x, new_y]
        end
    end
    array
  end 

  def initialize(position)
    @root_node = PolyTreeNode.new(positon)
    @start_position = position
    @considered_positions = [position]
  end

  def new_move_positions(pos)
    valids = KnightPathFinder.valid_moves(pos)
    unchecked = valids.select {  |moves| !@considered_positions.include?(moves) }
    @considered_positions += unchecked
    unchecked
  end

    def build_move_tree(position)
        que = [self.root_node.value]
        until que.empty?
            current_pos = que.shift
            return current_pos if current_pos == position
            que.concat(new_move_positions(current_pos))
        end
    end 
end
