#input: root of binary tree
#output: boolean

#goal: find if heights are balanced (left and right subtrees differ by no more than 1 height)

class TreeNode 
  attr_accessor :value, :left, :right

  def initialize(value, left, right)
    @value = value
    @left = left
    @right = right
  end
end

a = TreeNode.new(15, nil, nil)
b = TreeNode.new(7, nil, nil)
c = TreeNode.new(20, a, b)
e = TreeNode.new(9, nil, nil)
f = TreeNode.new(3, e, c)

def balanced_tree(root)
  left_height = 0
  right_height = 0
  if root.left
  end
end


