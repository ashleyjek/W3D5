require_relative "tree_node.rb"

class KnightPathFinder
    
    def self.root_node
        @starting_position = [0,0]
    end

    attr_reader :starting_position

    def initialize(starting_pos = [0,0])
        @starting_position = KnightPathFinder.root_node 
        # self.build_move_tree
        @considered_positions = [@starting_position.dup]
    end


    def self.valid_moves(pos)
        possible_fin = [[1,2],[2,1],[2,-1],[1,-2],[-2,-1],[-1,-2],[1,-2],[2,-1]]
        return_arr = []
        possible_fin.each do |test_pos|
            row = test_pos[0] + pos[0]
            col = test_pos[1] + pos[1]
            if row >= 0 && row <= 7 && col >= 0 && col <= 7
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

end