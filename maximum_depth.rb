#input; root of a binary tree
#output: maximum depth

test_input = [3,9,20,undefined,undefined,15,7]
test_output = 3

class TreeNode
    attr_accessor :value, :left, :right

    def initialize(value, left, right)
        @value = value
        @left = left
        @right = right
    end
end

def max_depth(root) # O(n); go through every node in the tree
    count = 0
    if root
        count += 1
    else
        return count
    end

    left_count = count + max_depth(root.left)
    right_count = count + max_depth(root.right)

    return [left_count, right_count].max
end

def max_depth_new(root) # runtime n
    if !root
        return 0
    end
    left_count = count + max_depth(root.left)
    right_count = count + max_depth(root.right)

    return [left_count, right_count].max + 1
end

puts max_depth(test_input)