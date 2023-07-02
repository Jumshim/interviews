# how to make a node
# how to go through tree

class TreeNode 
  attr_accessor :value, :children
  
  def initialize(value, children)
    @value = value
    @children = children
  end

end

a = TreeNode.new(3, [])
b = TreeNode.new(4, [])
c = TreeNode.new(5, [])
d = TreeNode.new(6, [a,b])
e = TreeNode.new(7, [c])
f = TreeNode.new(8, [d,e])

  #     f
  #  d     e
  # a b   c 

def exists_dfs(node)
  if node.value == 6
    return true
  else
    all_children_exists = false
    for child in node.children do
      all_children_exists = all_children_exists || exists_dfs(child)
    end
    return all_children_exists
  end
end

puts exists_dfs(f)

def exists_bfs(node)
  tracker = [node]
  while tracker.size != 0
    current_node = tracker.shift
    if current_node.value == 4
      return true
    end
    for child in current_node.children
      tracker << child
    end
  end
  return false
end

puts exists_bfs(f)


class Person
  attr_accessor :children, :parents

  def initialize(children, parents)
    @children = children
    @parents = parents
  end

  def hello
    puts 'hello'
  end

end