require_relative "tree_node.rb"

require "byebug"

module Searchable
    def dfs(target_value)
        # debugger
        
        if self.value == target_value
            return self
        end

        self.children.each do |child|
            result = child.dfs(target_value)
            if result != nil  
                return result
            end
        end
        return nil 
    end
end