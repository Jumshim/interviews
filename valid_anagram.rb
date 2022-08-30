example_1 = ['cat', 'tac']
example_2 = ["dormitory", "dirtyroom"]
example_3 = ["here", "heir"]

#input: 2 strings
#output: boolean

#goal: find if both strings are anagrams, same # of letters
#go through string one, adding a count to # of letters
#go through string two, decrementing appropriate letter

def valid_anagram(string_1, string_2)
  checker = Hash.new
  string_1.split('').each do |c|
    if checker[c]
      checker[c] += 1
    else
      checker[c] = 1
    end
  end
  string_2.split('').each do |c|
    if checker[c] == 1
      checker.delete(c)
    elsif checker[c].nil?
      return false
    else
      checker[c] -= 1
    end
  end
  return checker.empty?
end

puts valid_anagram(example_2[0], example_2[1])
puts valid_anagram(example_1[0], example_1[1])
puts valid_anagram(example_3[0], example_3[1])