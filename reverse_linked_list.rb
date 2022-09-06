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
  reversed_list = LinkedList.new
  values = []
  node = head
  while !node.nil? 
    values.push(node.value)
    node = node.next
  end
  while !values.empty?
    reversed_list.add(values.pop)
  end
  return reversed_list.head
end

example_1 = LinkedList.new
example_1.add(1)
example_1.add(2)
example_1.add(3)
example_1.add(4)
example_1.add(5)

print(reverse_linked_list(example_1.head))
