require_relative "tree_node.rb"
require_relative "Searchable"

class KnightPathFinder

include Searchable
    
    def self.root_node
        @starting_position = [0,0]
    end

    POSSIBLE_FIN = [[1,2],[2,1],[2,-1],[1,-2],[-2,-1],[-1,-2],[1,-2],[2,-1]]
    attr_reader :starting_position, :considered_positions

    def initialize(starting_pos = [0,0])
        @starting_position = starting_pos
        # self.build_move_tree
        @considered_positions = [starting_pos]
    end


    def self.valid_moves(pos)
        return_arr = []
        POSSIBLE_FIN.each do |test_pos|
            row = test_pos[0] + pos[0]
            col = test_pos[1] + pos[1]
            if row >= 0 && row <= 7 && col >= 0 && col <= 7  # && !@considered_positions.include?([row,col])
                return_arr << [row,col]
            end
        end
        return_arr
    end

    def new_moves_positions(pos)
        poss_moves = KnightPathFinder.valid_moves(pos)
        poss_moves = poss_moves.select {|pot_move| !@considered_positions.include?(pot_move)}
        poss_moves.uniq! if poss_moves != nil
        @considered_positions += poss_moves
        
        poss_moves
    end

    def build_move_tree
        queue = []

        knight = PolyTreeNode.new(self.starting_position)
        fin = knight
        queue << knight
      
        while !queue.empty?
            root = queue.shift
          
            children = self.new_moves_positions(root.value)
            
            children.each do |child|
                create_child = PolyTreeNode.new(child)
                root.add_child(create_child)
                queue << create_child
            end
            # debugger
        end
        fin
    end

    def find_path(end_pos)
        knight = self.build_move_tree
        trace_path_back(knight.bfs(end_pos))
    end
    
    def trace_path_back(knight)
        path = [knight.value]
        current = knight
        until current.parent == nil
            path << current.parent.value
            current = current.parent
        end
        path.reverse
    end



end

kpf = KnightPathFinder.new([0,0])
# p KnightPathFinder.valid_moves(kpf.starting_position)
# p kpf.build_move_tree
p kpf.find_path([6,2])
# endpoint.trace_path_back
