require_relative "tree_node.rb"

class KnightPathFinder
    
    def self.root_node
        @starting_position = [0,0]
    end

    POSSIBLE_FIN = [[1,2],[2,1],[2,-1],[1,-2],[-2,-1],[-1,-2],[1,-2],[2,-1]]
    attr_reader :starting_position, :considered_positions

    def initialize(starting_pos = [0,0])
        @starting_position = KnightPathFinder.root_node 
        # self.build_move_tree
        @considered_positions = [@starting_position.dup]
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
        @considered_positions << poss_moves
        poss_moves
    end

    def build_move_tree
        knight = PolyTreeNode.new(self.starting_position)
        children = self.new_moves_positions(self.starting_position)
        children.each do |child|
            test = PolyTreeNode.new(child)
            knight.add_child(test)
        end
        knight
    end
    



end

kpf = KnightPathFinder.new([0,0])
p KnightPathFinder.valid_moves(kpf.starting_position)
p kpf.build_move_tree