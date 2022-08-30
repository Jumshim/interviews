# input: string containing characters (, {, [

# goal: brackets are completed in correct order

# output: boolean true or false

example_1 = '({[{}]()})'
example_2 = '[]()'
example_3 = '({[])}'

def valid_parentheses(input)
  stack = []
  valid = true
  brackets = input.split('')
  for bracket in brackets 
    if bracket == '[' || bracket == '(' || bracket == '{'
      stack.push(bracket)
    end
    if bracket == ']'
      valid = valid && '[' == stack.pop
    elsif bracket == ')'
      valid = valid && '(' == stack.pop
    elsif bracket == '}'
      valid = valid && '{' == stack.pop
    end
  end
  valid
end

puts valid_parentheses(example_1)
puts valid_parentheses(example_2)
puts valid_parentheses(example_3)


# runtime: iterate over every character O(n), stack operations are O(1)
# final runtime: O(n)