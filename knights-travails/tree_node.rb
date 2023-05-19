
require "byebug"
require_relative "Searchable.rb"

class PolyTreeNode

include Searchable 

    attr_reader :value, :children, :parent
    
    def initialize(value)
        @value = value
        @children = []
        @parent = nil

    end

    def parent=(node)
        # debugger
        if node != nil && self.parent != nil
            self.parent.children.each_with_index do |child, i|
                if child.value == self.value
                    self.parent.children.delete_at(i)
                end
            end
        end
        @parent = node
        if node == nil
            return
        end
        if !node.children.include?(self)
            node.children << self
        end
    end

    def add_child(node)
        node.parent=(self)
    end

    def remove_child(node)
        if node.parent == nil 
            raise "error"
        else 
            node.parent=(nil)
        end
    end


end

