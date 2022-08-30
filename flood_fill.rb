=begin
input: integer grid "image" of size m x n
index integers sr and sc
color

goal: flood the grid; replace starting pixel with color, as well as 
any pixel connected 4-directionally to the middle pixel to that color


solution: don't know the size of grid, so it has to be recursion
base case: pixel doesn't match
recursive case: if pixel matches, change color and spread to all other pixels in 4 directions

blocker: out of index bounds

output: modified image
=end

def flood_fill(image, sr, sc, color, original_color=-1)
  puts "image: #{image}, sr: #{sr}, sc: #{sc}"
  ans = image
  temp = original_color
  if temp == -1
    temp = image[sr][sc]
  end
  if image[sr][sc] != temp
    return ans
  else
    ans[sr][sc] = color
    if sr < ans.length-1
      puts "sr 1"
      ans = flood_fill(ans, sr+1, sc, color, temp)
    end
    if sr > 0
      puts "sr 2"
      ans = flood_fill(ans, sr-1, sc, color, temp)
    end
    if sc < image[sr].length-1
      puts "sc 1"
      ans = flood_fill(ans, sr, sc+1, color, temp)
    end
    if sc > 0
      puts "sc 2"
      ans = flood_fill(ans, sr, sc-1, color, temp)
    end
  end
  return ans
end

test_case_1 = {image: [[1,1,1], [1,1,0], [1,0,1]], sr: 1, sc: 1, color: 2}
puts flood_fill(test_case_1[:image], test_case_1[:sr], test_case_1[:sc], test_case_1[:color])
test_case_2 = {image: [[0,0,0], [0,0,0]], sr: 0, sc: 0, color: 0}
puts flood_fill(test_case_2[:image], test_case_2[:sr], test_case_2[:sc], test_case_2[:color])

