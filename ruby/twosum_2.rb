#input: int array, int target
#goal: indicies of 2 numbers in array so they add up to target
#output: 2 indices

#1st attempt: 2 for loops, checking each of them

example_1 = [1,2,3,4,5,6,7]
ex_1_target = 3

example_2 = [2,5,8,3,1,12]
ex_2_target = 11


def two_sum(nums, target)
  (0..nums.length-1).each do |i|
    (i+1..nums.length-1).each do |j|
      return [i,j] if nums[i] + nums[j] == target
    end
  end
  return 0 
end

pp two_sum(example_1, ex_1_target)
pp two_sum(example_2, ex_2_target)

def two_sum_new(nums, target)
  hash = {}
  nums.each_with_index do |num, i|
    if hash[target-num]
      return [hash[target-num], i]
    end
    hash[num] = i
  end
end

puts 'two_sum_new: '
pp two_sum_new(example_1, ex_1_target)
pp two_sum_new(example_2, ex_2_target)
