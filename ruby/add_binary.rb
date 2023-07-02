=begin
input: 2 binary strings
output: sum of the binary strings in base 2


2 ways to do this:
  - convert to decimal, add decimal, convert sum to binary
  - binary addition (carry over the 1s)

  1st approach will be converting to decimal

  method 1: decimal(binary)
  binary.reverse.split("").each do || with a counter

  method 2: binary(decimal)
  mod 2 loop
=end

# 15 -> 01111

def decimal(binary)
  counter = 0
  sum = 0
  binary.reverse.split("").each do |b|
    sum +=(2**counter) * b.to_i
    counter += 1
  end
  return sum
end

def binary(decimal)
  b_string = ""
  while decimal > 0
    b_string.prepend("#{decimal % 2}")
    decimal /= 2
  end
  return b_string
end

def add_binary(s1, s2)
  return "0" if s1 == "0" && s2 == "0"
  s1 = decimal(s1)
  s2 = decimal(s2)
  sum = s1 + s2
  return binary(sum)
end

pp binary(16)
pp add_binary("11", "1")

=begin
BIT MANIPULATION ANSWER:

=end