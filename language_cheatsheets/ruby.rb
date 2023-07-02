numbers = [1, 2, 3, 4, 5]

# Filtering through an array of objects
# Ruby Enumerable module, :even and :odd are methods. ? makes it a boolean
# shortcut for doing {|i| i.even?}
x = numbers.select(&:even?)
y = numbers.select(&:odd?)
z = numbers.reject(&:even?)
pp "x: #{x}"
pp "y: #{y}, z: #{z}"
pp "y equal to z: #{y == z}" # checks contents
pp "y equal to z: #{y.equal?(z)}" # checks identity

# for each loops
# numbers.each do |n|
#   pp "current number: #{n}"
# end

hash = {a: 1, b: 2}
# iterating over hash key, value pairs
hash.each do |key, value|
  pp "#{key} maps to #{value}"
end

random_array = ['John', 'Joe', 'Alex', '']
# .each_with_object method
hash = random_array.each_with_object(Hash.new(0)) do |element, hash|
  hash[element] += 1
end
puts "-----HASH vs HASH -> ARRAY-----"
pp hash # {"John"=>1, "Joe"=>1, "Alex"=>1, ""=>1}
pp hash.to_a # [["John", 1], ["Joe", 1], ["Alex", 1], ["", 1]] | establishes tuples

random_array.each_with_index do |element, i|
  pp "#{element} at position #{i}"
end

# String iterations
string = "Alpha Psi"
puts "-----STRING ITERATION 1-----"
string.split("").each do |c|
  pp c
end

puts "----STRING ITERATION 2-----"
string.split("").each_with_index do |c,i|
  pp "#{c} at position #{i}"
end

puts "-----STRING ITERATION 3-----"
(0..string.length).each do |i|
  pp string[i]
end


puts "-----HTTP REQUESTS-----"
require 'http'
require 'json'
response = HTTP.get("https://www.boredapi.com/api/" + "activity")
pp response.parse
# pp response.parse.to_json
pp response.code

puts "-----CLASS DECLARATION-----"
class Game
  attr_accessor :num_players, :players, :deck, :winners

  def initialize(num_players)
    @num_players = num_players
    @players = []
    @deck = []
    @winners = []
  end

  def distribute_cards(deck, players)
    num_players = players.length
    (0..deck.length - 1).each do |i|
      if index = i % num_players
        players[index][:hand].push(deck[i])
      end
    end
  end

  def turn(players)
    current_pool = []
    players.each do |player|
      current_pool.push(player[:hand].pop) unless player[:hand].empty?
    end
    # returns index of the last object s.t. self === parameter
    winner = current_pool.rindex(current_pool.max)
    players[winner][:points] += 1
  end

  def setup_game(deck, players, num_players)
    (0..51).each do |i|
      deck.push(i)
    end
    deck.shuffle!

    (0..num_players -1).each do |i|
      players[i] = {hand: [], points: 0}
    end
  end

  def determine_game(players)
    max_points = players[0][:points]
    winners = []
    players.each do |player|
      max_points = player[:points] if player[:points] > max_points
    end

    (0..players.length-1).each do |i|
      winners.push(i) if players[i][:points] == max_points
    end

    if winners.length == 1
      puts "player_#{winners[0] + 1} wins with #{max_points} points!"
    else
      puts "it's a tie game!"
    end
  end

  def play_game
    setup_game(deck, players, num_players)
    distribute_cards(deck, players)
    (0..players[0][:hand].length - 1).each do
      turn(players)
    end
    determine_game(players)
  end
end

1.times do
  game = Game.new(5)
  game.play_game
end