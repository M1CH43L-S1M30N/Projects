require_relative "00_tree_node"
require "byebug"

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
    @root_node = PolyTreeNode.new(position)
    @start_position = position
    @considered_positions = [position]
    build_move_tree
  end

  def new_move_positions(pos)
    valids = KnightPathFinder.valid_moves(pos)
    unchecked = valids.select {  |moves| !@considered_positions.include?(moves) }
    @considered_positions += unchecked
    unchecked
  end

   def build_move_tree
        que = [root_node]
        until que.empty?
            current_node = que.shift
            new_move_positions(current_node.value).each do |new_pos|
		          next_node = PolyTreeNode.new(new_pos)
		          current_node.add_child(next_node)
		          que << next_node
	          end
        end
    end 

    def find_path(end_pos)
      end_node = root_node.bfs(end_pos)
      trace_path_back(end_node)
    end

    def trace_path_back(end_node)
      moves = []
      que = [end_node]
      until que.empty?
        current_node = que.shift
        moves.unshift(current_node.value)
        que << current_node.parent if current_node.parent
      end
      moves
    end
end

