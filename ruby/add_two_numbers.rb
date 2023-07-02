#input: 2 linked lists of numbers
#output: return sum as linked list

=begin
  LinkedLists are inputted as numbers
  ex. 123 is inputted as 3 -> 2 -> 1

  go through linked list, append to array, then .reverse.join it

  add, then .split.reverse it
=end

class ListNode
  attr_accessor :value, :next 

  def initialize(value, _next)
    @value = value
    @next = _next
  end
end

a = ListNode.new(4, nil)
b = ListNode.new(6, a)
c = ListNode.new(5, b)

x = ListNode.new(3, nil)
y = ListNode.new(4, x)
z = ListNode.new(2, y)


def add_two_numbers(head1, head2)
  num_1 = []
  num_2 = []
  ans = []
  node = head1
  while !node.nil?
    num_1.prepend(node.value)
    node = node.next
  end
  node = head2
  while !node.nil?
    num_2.prepend(node.value)
    node = node.next
  end
  sum = (num_1.join.to_i + num_2.join.to_i)
  return [0] if sum==0
  while sum > 0
    ans.push(sum % 10)
    sum /= 10
  end
  return ans
end

pp add_two_numbers(c, z)

