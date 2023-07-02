#input: 2D int array
#goal: array of elements in spiral order
#output: int array

=begin
1 2 3
4 5 6
7 8 9

1 - 2 - 3 - 6 - 9 - 8 - 7 - 4 - 5

(0,0), (0,1), (0,2), (1,2), (2,2), (2,1), (2,0), (1,0), (1,1)

1  2  3  4
5  6  7  8
9 10 11 12

1 - 2 - 3 - 4 - 8 - 12 - 11 - 10 - 9 - 5 - 6 - 7
=end

input = [[1,2,3],[4,5,6],[7,8,9]]
input_2 = [[1,2,3,4],[5,6,7,8],[9,10,11,12]]

def spiral_matrix(matrix)
  total_count = matrix.length * matrix[0].length
  ans = []
  i = 0
  j = 0
  boundary = 1
  ans.push(matrix[i][j])
  while(ans.length < matrix.length * matrix[0].length)
    while(j < matrix[0].length - boundary)
      j += 1
      ans.push(matrix[i][j])
    end
    while(i < matrix.length-boundary)
      i += 1
      ans.push(matrix[i][j])
    end
    break if(ans.length == total_count)
    while(j >= boundary)
      j -= 1
      ans.push(matrix[i][j])
    end
    while(i > boundary)
      i -= 1
      ans.push(matrix[i][j])
    end
    boundary += 1
  end
  return ans
end

pp "FIRST INPUT"
pp spiral_matrix(input)
pp "----------"
pp "SECOND INPUT"
pp spiral_matrix(input_2)