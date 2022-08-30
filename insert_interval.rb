#input: array of intervals [start, end] in ascending order, new interval
#output: new array of intervals without any overlapping

test1_array = [[1,5], [7,9], [11,17]]
test1_input = [4,8]
answer1 = [[1,9],[11,17]]

test2_array = [[1,5],[9,12]]
test2_input = [6,8]

test3_array = [[1,4],[5,9],[11,15]]
test3_input = [7,10]
answer = [[1,4],[5,10],[11,15]]

# iterate through intervals
# find new interval's proper location
# merge necessary intervals



def insert(intervals, new_interval)
  ans = []
  for interval in intervals do
    if interval[1] < new_interval[0]
      ans.push(interval)
    elsif interval[0] < new_interval[0]
      
end

insert(test1_array, test1_input)
insert(test2_array, test2_input)