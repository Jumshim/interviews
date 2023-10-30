=begin
# Rock Paper Scissors

You've been given the task of verifying historical games of **Rock Paper Scissors**.
  # verifying

Create a function/script that can take a serialized game of Rock Paper Scissors as an input and declare:

- the winner
  - What defines a winner
- how many rounds the game lasted

If the input is invalid this should be flagged and no winner should be declared.
- What is an invalid input?
## Syntax

```
[best_of][round1][round2][round3]...[roundn]
```

### Example

```
3PPRSRRSRPR
```

- `3` = best of 3 (so the first player to 2 wins)
- `[PP][RS][RR][SR][PR]` = each player's choice per round

```
       round 1
paper     |     paper
0         |         0
        *tie*
       round 2
rock      |  scissors
1         |         0
        *p1*
       round 3
rock      |      rock
1         |         0
        *tie*
       round 4
scissors  |      rock
1         |         1
        *p2*
       round 5
paper     |      rock
2         |         1
      *p1 wins*
```

## Examples

### Valid Games

```
> analyze("3PPRSRRPR")
player 1 wins in 4 rounds

> analyze("5SRRPPS")
player 2 wins in 3 rounds

> analyze("5RSRSRRSSSRPPRRSSPPPR")
player 1 wins in 10 rounds

> analyze("11PRPRSSSSRSPPPSSRRSRPRRSRRPRP")
player 2 wins in 14 rounds
```
func main()

end



### Invalid Games

```
> analyze("4RSRSRSRS")  # "best of" needs to be an odd integer
invalid game

> analyze("3PRSPPP")    # game should have ended after two rounds
invalid game

> analyze("7PPS")       # 2nd round is incomplete
invalid game

> analyze("1XY")        # Choices must be one of {R, P, S}
invalid game

> analyze("abcd1234")   # input must be an odd integer followed by a pair of choices for each round
invalid game

Rock Paper Scissors

2 players, 3 Choices
- R, P, S
  - R > S, S > P, P > R
- Best of [odd integer]
  - [odd integer] / 2 + 1
  - 3 --> 2
  - 5 --> 3
  - 7 --> 4

Input line, parse through the rounds

Checking if it's an invalid game

Play each of the rounds
  - Keep track of the score

Check if it's a valid game
- player 1 wins in 4 rounds
- "player #{player_number} wins in #{num_rounds} rounds"
=end

class RockPaperScissors
  # player score [] {0 => int, 1 => int}
  # number of rounds
  # rounds []

  VALID_CHOICES = ['R', 'P', 'S']

  def initialize()
    @score = {1 => 0, 2 => 0}
    @best_of = 0
    @rounds = []
    @length_of_start = 0
  end

  def parse_line(line)
    best_of = ""
    line.split('').each do |char|
      break if not is_digit(char)
      @length_of_start += 1
      best_of += char
    end
    if is_digit(best_of) && is_odd(best_of)
      @best_of = best_of.to_i # is_digit, is_odd
      # puts "num_rounds: #{num_rounds}"
    else
      puts "invalid game"
      return
    end

    (@length_of_start..line.length - 1).each_slice(2) do |player_1, player_2|
      if (player_2.nil?) || (not VALID_CHOICES.include?(line[player_1])) || (not VALID_CHOICES.include?(line[player_2]))
        puts "invalid game -- choices"
        return
      end
      @rounds.push({'player_1' => line[player_1], 'player_2' => line[player_2]})
      # puts "player_1 #{player_1}, player_2 #{player_2}"
    end
  end

  # go through each of the rounds
  # compare player choices
  # determine tie game or winner
  # increment player score && rounds accordingly
  def play_rounds()
    played_rounds = 0
    @rounds.each do |round|
      played_rounds += 1
      winner = choose_winner(round['player_1'], round['player_2'])
      next if winner == 0
      @score[winner] += 1
      if determine_winner() != 0
        if played_rounds != @rounds.length
          puts "invalid game"
          return
        end
        # played_rounds == num_rounds @rounds.length
      end
    end
    # puts "scores: #{@score}, num_rounds: #{@rounds.length}"
  end

  def determine_winner()
    # scores of the players
    # best of 
      # whichever player == (best_of / 2) + 1
    return 1 if @score[1] == (@best_of / 2) + 1
    return 2 if @score[2] == (@best_of / 2) + 1
    return 0
  end

  def play_game(line)
    @score = {1 => 0, 2 => 0}
    @best_of = 0
    @rounds = []
    @length_of_start = 0
    parse_line(line)
    play_rounds()
    puts "player #{self.determine_winner()} wins in #{self.num_rounds()} rounds"
  end

  def num_rounds()
    return @rounds.length
  end

  private

  # 0 = tie game
  # 1 = player_1 wins
  # 2 = player_2 wins
  def choose_winner(player_1, player_2)
    return 0 if player_1 == player_2
    return 1 if (player_1 == "R" && player_2 == "S") || (player_1 == "P" && player_2 == "R") || (player_1 == "S" && player_2 == "P") 
    return 2
  end

  def is_digit(char)
    char.match?(/[1-9][0-9]?+/)
  end

  def is_odd(char)
    integer = char.to_i
    return integer % 2 == 1
  end

end

game = RockPaperScissors.new()
# game.parse_line("0abc")
# game.parse_line("abc123")
# game.parse_line("3RRPPSS")
# game.parse_line("3RRPPSSS")
## Valid Cases
puts "----VALID----"
game.play_game("3PPRSRRPR")
game.play_game("5SRRPPS")
game.play_game("5RSRSRRSSSRPPRRSSPPPR")
game.play_game("11PRPRSSSSRSPPPSSRRSRPRRSRRPRP")

## Invalid Cases
puts "-----INVALID-----"
game.play_game("4RSRSRSRS")
game.play_game("3PRSPPP")
game.play_game("7PPS")
game.play_game("1XY")
game.play_game("abcd1234")
# ```
# > analyze("3PPRSRRPR")
# player 1 wins in 4 rounds

# > analyze("5SRRPPS")
# player 2 wins in 3 rounds

# > analyze("5RSRSRRSSSRPPRRSSPPPR")
# player 1 wins in 10 rounds

# > analyze("11PRPRSSSSRSPPPSSRRSRPRRSRRPRP")
# player 2 wins in 14 rounds
# ```

# > analyze("4RSRSRSRS")  # "best of" needs to be an odd integer
# invalid game

# > analyze("3PRSPPP")    # game should have ended after two rounds
# invalid game

# > analyze("7PPS")       # 2nd round is incomplete
# invalid game

# > analyze("1XY")        # Choices must be one of {R, P, S}
# invalid game

# > analyze("abcd1234")   # input must be an odd integer followed by a pair of choices for each round
# invalid game
