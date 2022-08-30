testArray = [2, 3, 5, 6, 6, 8]
testTarget = 8

# loop through each individual pair to see if they add up to target
# returns the indexes of the pair

def twoSum(numbers, target)
  arr_size = numbers.length
  for i in 0..arr_size do # n
    for j in i..arr_size do # (n-1)/2
      if numbers[i] + numbers[j] == target
        return [i,j] # 2 items, O(1)
      end
    end
  end
end

puts twoSum(testArray, testTarget)

def twoSumNew(numbers, target)
  swag = Hash.new
  for i in 0..numbers.size do # n
    diff = target-numbers[i]
    swag[numbers[i]] = i
    if swag[diff] && swag[diff]>i # 1
      return [i,swag[diff]] # 1
    end
  end
end

puts 'Starting twoSumNew'
puts twoSum(testArray, testTarget)

# Takeaways
# Putting placeholders, thinking about time complexity and which data structures match it, time and space complexity