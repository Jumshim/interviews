#input: array, prices, which lists the price of a given stock on the ith day
#output: int, max price we can get

example_1 = [1,4,5,11,9,8]
example_2 = [3,5,4,6,7,10]
example_3 = [10,8,5,3,2,4]
example_4 = [2,4,1]
example_5 = [1,2]

def max_profit(prices)
  lowest_price = prices[0]
  index_of_lowest = 0
  profit = 0
  for i in 0...prices.length
      if (lowest_price > prices[i])
          lowest_price = prices[i]
      end
      if prices[i]-lowest_price > profit
        profit = prices[i]-lowest_price
      end
  end
  return profit
end

puts "example_1: #{max_profit(example_1)}"
puts "example_2: #{max_profit(example_2)}"
puts "example_3: #{max_profit(example_3)}"
puts "example_4: #{max_profit(example_4)}"
puts "example_5: #{max_profit(example_5)}"