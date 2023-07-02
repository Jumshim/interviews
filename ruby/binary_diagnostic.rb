# counts = [0,0,0,0,0,0,0,0,0,0,0,0]
# total_count = 0

# 1100 111 0101

# IO.foreach('binary_diagnostic_input.txt') do |line|
#   temp = line
#   index = 11
#   (0..12).each do |i|
#     last = temp[-1]
#     if last == "1"
#       counts[index] += 1
#     end
#     temp = temp.chop
#     index -= 1
#   end
#   total_count += 1
# end

# pp counts
# pp total_count

# # gamma rate

# gamma_rate = ""

# for digit in counts do 
#   if digit < 500
#     gamma_rate << "0"
#   else 
#     gamma_rate << "1"
#   end
# end

# pp "Gamma Rate in Binary: #{gamma_rate}"


# epsilon_rate = ""
# for digit in counts do 
#   if digit < 500
#     epsilon_rate << "1"
#   else 
#     epsilon_rate << "0"
#   end
# end
# pp "Epsilon Rate in Binary: #{epsilon_rate}"


numbers = []

IO.foreach('binary_diagnostic_input.txt') do |line|
  numbers.push(line[0..11])
end

gamma = numbers.map(&:chars).transpose.map do |bits|
  count = bits.select.count { |bit| bit == "0" }

  if count > bits.size / 2
    "0"
  else
    "1"
  end
end

gamma = gamma.join.to_i(2)
epsilon = gamma ^ (2**12 - 1)

puts gamma * epsilon