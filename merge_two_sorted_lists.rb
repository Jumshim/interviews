# input: heads of 2 sorted linked lists
# goal: return a merged, sorted linked list
# output: return head of new linked list

class LinkedList
  attr_accessor :head

  def initialize
    @head = nil
  end

  def add(value)
    if(@head.nil?)
      @head = Node.new(value, nil)
    else
      n = @head
      while(!n.next_node.nil?)
        n = n.next_node
      end
      n.next_node = Node.new(value, nil)
    end
  end
end

class Node
  attr_accessor :value, :next_node

  def initialize(value, next_node)
    @value = value
    @next_node = next_node
  end
end

def print(head)
  s = "list: "
  n = head
  while(!n.nil?)
    s += n.value.to_s + " "
    n = n.next_node
  end
  puts s
end

example_1 = LinkedList.new
example_1.add(2)
example_1.add(4)
example_1.add(6)
example_1.add(8)

example_2 = LinkedList.new
example_2.add(1)
example_2.add(7)
example_2.add(9)
example_2.add(11)
example_2.add(13)

example_3 = LinkedList.new

# compare current_node1 with current_node2, append smaller node

def merge_two_sorted_lists(head1, head2)
  node1 = head1
  node2 = head2
  answer = LinkedList.new
  while(!node1.nil? || !node2.nil?)
    if(node1 && node2.nil?)
      answer.add(node1.value)
      node1 = node1.next_node
    elsif(node2 && node1.nil?)
      answer.add(node2.value)
      node2 = node2.next_node
    elsif(!node1.nil? && node1.value <= node2.value) 
      answer.add(node1.value)
      node1 = node1.next_node
    else
      answer.add(node2.value)
      node2 = node2.next_node
    end
  end
  answer.head
end

print(merge_two_sorted_lists(example_1.head, example_2.head))
print(merge_two_sorted_lists(example_1.head, example_3.head))