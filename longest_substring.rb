#input: string s
#goal: iterate over string to find longest substring w/o repeating chars
#output: length of longest substr

example_1 = "hello"
example_1_ans = 3 #hel

example_2 = "bbbbb"
example_2_ans = 1 #b

example_3 = "ewewhho"
example_3_ans = 3 #ewh

example_4 = "abba"
example_4_ans = 2

def longest_substring(s)
  max_length = 0
  curr_start = 0
  chars = {}
  return 0 if s == ""
  s.split("").each_with_index do |c, i|
    if chars[c].nil? then
      chars[c] = i
    else
      curr_start = chars[c] + 1
      chars.clear
      chars[c] = i
    end
    max_length = (i-curr_start) if (i-curr_start) > max_length
  end
  return max_length + 1
end

#solution: sliding window

pp longest_substring(example_1)
pp longest_substring(example_2)
pp longest_substring(example_3)
pp longest_substring(example_4)