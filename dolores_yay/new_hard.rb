EXAMPLE = [''] * 9
POSSIBLE_STATES = ['', 'X', 'O']
ENUMERATED = []

# goal: have every single combo
# think of it recursively!
# flip the bit of every index
# give

# RECURSION
def enumerate(new_example, index)
  if index == 9
    ENUMERATED.push(new_example)
    return
  end
  POSSIBLE_STATES.each do |state|
    example = new_example.dup 
    example[index] = state
    enumerate(example, index + 1)
  end
end

enumerate(EXAMPLE, 0)
puts ENUMERATED.length
