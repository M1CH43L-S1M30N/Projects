class PolyTreeNode

    attr_reader :value, :parent, :children

    def initialize(node)
        @value = node
        @parent = nil
        @children = []
    end
    
    def parent=(parent_node)
        @parent.children.delete(self) if !@parent.nil? 
        @parent = parent_node
        parent_node.children << self unless parent_node.nil? || parent_node.children.include?(self)
    end

    def add_child(child_node)
        child_node.parent = self
    end

    def remove_child(child_node)
        if children.include?(child_node)
           child_node.parent = nil
        else
            raise "you are not the father"
        end
    end 
     
    def dfs(value)
       return self if self.value == value
        @children.each do |child|
            result = child.dfs(value)
            return result if result
        end
        nil
    end

    def bfs(value)
        queue = [self]
        until queue.empty?
          current_node = queue.shift
          return current_node if current_node.value == value
          queue.concat(current_node.children)
        end
      nil
    end
end