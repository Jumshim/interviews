#input: string s
#goal: iterate over string to find longest substring w/o repeating chars
#output: length of longest substr

example_1 = "hello"
example_1_ans = 3 #hel

example_2 = "bbbbb"
example_2_ans = 1 #b

example_3 = "ewewhho"
example_3_ans = 3 #ewh

example_4 = "dvdf"
example_4_ans = 3

def longest_substring(s)
  char = {}
  max_len = 0
  curr_start = 0
  s.split("").each_with_index do |c, i|
    if char[c].nil?
      char[c] = i
    elsif char[c]
      if char[c] < curr_start
        char[c] = i
      else 
        curr_start = char[c] + 1
        char[c] = i
      end
    end
    max_len = (i-curr_start+1) if (i-curr_start+1) > max_len
  end
  return max_len
end

#solution: sliding window

pp longest_substring(example_1)
pp longest_substring(example_2)
pp longest_substring(example_3)
pp longest_substring(example_4)