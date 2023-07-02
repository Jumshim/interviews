=begin
input: head of singly linked list
output: head of reversed linked list
=end

class ListNode
  attr_accessor :value, :next

  def initialize(value, _next)
    @value = value
    @next = _next
  end
end

class LinkedList 
  attr_accessor :head

  def initialize
    @head = nil
  end

  def add(value)
    if @head.nil?
      @head = ListNode.new(value, nil)
    else 
      node = @head
      while node.next != nil
        node = node.next
      end
      temp = ListNode.new(value, nil)
      node.next = temp
    end
  end
end

def print(head)
  s = "list: " 
  node = head
  while !node.nil?
    s += "#{node.value} -> "
    node = node.next
  end
  pp s
end 

def reverse_linked_list(head)
  head_node = head
  current_node = head
  while !current_node.next.nil?
    temp = current_node.next
    current_node.next = current_node.next.next
    temp.next = head_node
    head_node = temp
  end
  head_node
end

example_1 = LinkedList.new
example_1.add(1)
example_1.add(2)
example_1.add(3)
example_1.add(4)
example_1.add(5)

print("example_1: #{reverse_linked_list(example_1.head)}")

example_2 = LinkedList.new
example_2.add(1)
example_2.add(2)


=begin

1 -> 2 -> 3 -> 4 -> 5   |    5 -> 4 -> 3 -> 2 -> 1


1 -> 2   |  2 -> 1

info we have: 
head node, node has a value and a next
we don't care about the value

we can create temporary nodes and delete other nodes

if we want to reverse, we should also try to not use more memory and make a new linked list

head_node = head
current_node = head
temp = current_node.next
current_node.next = current_node.next&.next
temp.next = head_node
head_node = temp

1 -> 2 -> 3 -> 4 -> 5
 
current_node = 1
temp = 2
1 -> 3
2 -> 1
2 -> 1 -> 3 -> 4 -> 5

temp = 3
1 -> 4
3->2
3->2->1->4->5

head_node = 3
current_node = 1
temp = 4
1 -> 5
4->3
head = 4
4->3->2->1->5


=end