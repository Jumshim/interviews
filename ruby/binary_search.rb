#input: array of sorted numbers, target integer
#output: index of target, or -1 if n/a

=begin
  keep halving array length to find searchable interval for index
  if smaller, go left side. if larger, go right side
  recursion
=end

example_1 =[[0,1,2,3,4,5,6], 2]
example_1_ans = 2
example_2 = [[0], 1]
example_2_ans = -1
example_3 = [[1,2,3,4,5,6,7], 8]
example_3_ans = -1
example_4 = [[1,5,6,8,10,20], 10]
example_4_ans = 4

def binary_search(nums, target)
  ans = 0
  if nums.length == 1
    return nums[0]==target ? 0 : -1
  elsif nums[nums.length/2] == target
    ans = nums.length/2
  elsif target < nums[nums.length/2]
    ans = binary_search(nums[0..nums.length/2], target)
  elsif target > nums[nums.length/2]
    ans = nums.length/2 + binary_search(nums[nums.length/2..nums.length-1], target)
  end
  return ans
end

def bin_search(nums, target)
  interval = [0, nums.length-1]
  if(nums.length == 1) 
    return nums[0] == target ? 0 : -1
  end
  while interval[0] != interval[1] do
    puts "interval: #{interval}"
    puts "checking: #{interval[1]/2}"
    if target == nums[interval[1]/2]
      return interval[1]/2
    elsif target < nums[interval[1]/2]
      interval  = [0, interval[1]/2-1]
    else target > nums[interval[1]/2]
      interval = [interval[1]/2+1, interval[1]]
    end
  end
  puts "interval at end: #{interval}"
  return interval[0] == target ? interval[0] : -1
end

def b_search(nums, target)
  start = 0
  last = nums.length - 1
  while start <= last
    index = (start + last) / 2
    puts "index: #{index}"
    if nums[index] == target
      return index
    elsif nums[index] > target
      last = index - 1
    elsif nums[index] < target
      start = index + 1
    else
      return -1
    end
  end
  return -1
end

puts "example_1: #{example_1_ans == b_search(example_1[0], example_1[1])}"
puts "example_2: #{example_2_ans == b_search(example_2[0], example_2[1])}"
puts "example_3: #{example_3_ans == b_search(example_3[0], example_3[1])}"
puts "example_4: #{example_4_ans == b_search(example_4[0], example_4[1])}"