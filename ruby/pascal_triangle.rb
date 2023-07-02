#input: num rows
#output: first numrows of Pascal's Triangle

=begin
  goal: simulate pascal's triangle

     1           0
    1 1          1
   1 2 1         2
  1 3 3 1        3
 1 4 6 4 1       4
1 5 10 10 5 1    5
..
  pattern? starts and ends with one,
  odd rows have 

  iterate num_rows times
  each iteration should simulate pascal's triangle

  Math.factorial(n) / Math.factorial((n-k)) * Math.factorial(r)
end

=end 

def factorial(n)
  return 1 if n==0
  return n*factorial(n-1)
end

def n_choose_k(n, k)
  return factorial(n) / (factorial(n-k) * factorial(k))
end

def Pascal_Triangle(num_rows)
  ans = []
  (0..num_rows-1).each do |i|
    temp = []
    (0..i).each do |j|
      temp.push(n_choose_k(i,j))
    end
    ans.push(temp)
  end
  return ans
end

pp Pascal_Triangle(3)