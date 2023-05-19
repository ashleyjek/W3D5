class PolyTreeNode

    attr_reader :value, :children, :parent
    
    def initialize(value)
        @value = value
        @children = []
        @parent = nil

    end

    def parent=(node)
        if @parent != nil
            @parent.children.each_with_index do |child, i|
                if child == node
                    @parent.children.delete_at(i)
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


end