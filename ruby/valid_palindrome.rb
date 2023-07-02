#input: string
#output: Boolean

#goal: determine if string is palindrome; same forward and backwards
#hints: convert to lowercase, remove all non-alpha chars

example_1 = "racecar"
example_2 = " "
example_3 = "Race a car!"
example_4 = "hello"
example_5 = "A man, a plan, a canal: Panama"
# remove non-alphas through regex
# 
def valid_palindrome(str)
  return true if str.length() == 1
  convert = str.gsub(/[^0-9a-z]/i, '').downcase
  split = convert.split('')
  size = split.length
  ans = true
  for i in 0..size/2-1
    if split[i] == split[size-i-1]
      split.pop
    else
      ans = false
    end
  end
  return ans
end

#runtime: O(logn), where n is # of chars in str 
# only goes through half of the string

#memory: 

def is_palindrome(s)
  return str.gsub(/[^0-9a-z]/i, '').downcase == str.gsub(/[^0-9a-z]/i, '').downcase.reverse
end

puts valid_palindrome(example_5)
puts is_palindrome(example_5)

=begin

good algorithmic thinking in original solution, but solution could have been
O(1) if I had known about .reverse for strings

also, learn and become more comfortable with regex.
String manipulation isn't as easy as c++ .isalpha

good debugging practices though :thumbs_up:

end