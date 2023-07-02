=begin
input: head of singly linked list

output: middle node of linked list


example 1

1 -> 2 -> 3 -> 4 -> 5
3 

example 2

1 -> 2 -> 3 -> 4 -> 5

known: head

necessary unknowns: length of linked list

we need a way to traverse through the linked list and find its end

solution 1: 
- using 1 pointer and traversing through the linked list, then tracking how many it went through 
- getting that length and traversing again for half the length
- O(nlogn) / O(n) memory

is there a way to go faster? traverse the linked list only once

solution 2: double pointers
- one going 2x as fast
- one going 1x as fast
=end

def middle_list(head)
  fast = head
  regular = head
  while !fast&.next.nil?
    regular = regular.next
    fast = fast.next.next
  end
  return regular
end