=begin
input: root of bt
output: longest path between 2 nodes

        8
    3      10
   2 4    9  11
  1   5
       6
        7

  longest_path: 7

  preorder: making bst
  inorder: in order
  postorder: deleting bst

  left -> right -> center



=end

def diameter_of_binary_tree(root)
  node = root
  length = 0
  diameter_of_binary_tree(root.left) if node.left
  diameter_of_binary_tree(root.right) if node.right
  pp node.val
end

=begin
known observations:
  longest path is between 2 leaf nodes
  Nodes are onnected by a parent node and 2 children
  Thus: longest path would consist of a node, longest left branch, longest right branch

  Goal? Find node where node.left and node.right is maximized
    Apply: DFS to count each node's branch lengths

  Leetcode solution:

  
=end