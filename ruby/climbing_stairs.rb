# input: # of steps to get to the top

# output: # of distinct ways to get to the top

=begin
  0 steps: 0
  1 steps: 1
  2 steps: 2
    1 - 1, 2
  3 steps: 3
    1-1-1, 2-1, 1-2
  4 steps: 5
   1-1-1-1, 2-1-1, 1-2-1, 1-1-2, 2-2
  5 steps: 8
   1-1-1-1-1, 2-1-1-1, 1-2-1-1, 1-1-2-1, 1-1-1-2, 2-2-1, 2-1-2, 1-2-2

  1 2 3 5 8
  2nd step: 0 step + 1 step
  3rd step: 1 step + 2 step
=end

def climbing_stairs(steps)
  ant = 1
  prev = 1
  sum = prev
  return sum if steps == 1
  (2..steps).each do 
    sum = ant + prev
    ant = prev
    prev = sum
  end
  return sum
end

pp "ways to climb 2 stairs: #{climbing_stairs(2)}"
pp "ways to climb 5 stairs: #{climbing_stairs(5)}"

