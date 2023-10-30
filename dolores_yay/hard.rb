# =begin
# enumeration_style_problem

# Write a program that plays every possible tic-tac-toe game and print the number of valid games

# Tic-Tac-Toe game:
# 1) Whole board is filled
# - Exception when X or O wins early 
# 2) 3 x 3 sqiare
# 3) 2 players 'X' and 'O'


# Valid Game:
# 1) Cat games are valid
# 2) Winning games are valid

# no input value
# outputting: integer of valid games


# 1) How to simulate a tic-tac-toe game
# 2) how to simulate **every possible** tic-tac-toe game
# 3) how to categorize a game as valid
# 4) keeping track of the count

# # define what a game is
# =end

# class Game
#   attr_accessor :board, :current_player

#   def initialize()
#     @board = [][]
#     @current_player = 'X'
#   end
#   # turns
#   # players, X and O
# end

# =begin
#   X | O  |
# - - - - - -
#    |   |
# - - - - - -
#    |   |
# =end

# 9 * 8 * 7 * 6 * 5 * 4 * 3 * 2 * 1
# X   0   X   0   X   0   X   0   X

# # Node state of a game board

# Start of the game
# - state of an empty board
# - append all other states of that board onto the queue
# []
# [Game, Game, ...]
# - Get the next state
# - Check if valid (count += 1 if yes)
# - append all next states of that board onto the queue

# Enumeration:
# - list out all possibilities
# - eliminate

# Get all permutations of a board (X, O, '')
# - iterating through
# - if not valid, cut it out / skip 

# initial_state = 
# [
# ['', '', ''],
# ['', '', ''],
# ['', '', '']
# ]

# [
#   ['X', '', ''],
#   ['', '', ''],
#   ['', '', '']
# ]

# [
#   ['O', '', ''],
#   ['', '', ''],
#   ['', '', '']
#   ]
  
#   [
#     ['X', 'X', ''],
#     ['', '', ''],
#     ['', '', '']
#     ]
#     [
#       ['X', 'O', ''],
#       ['', '', ''],
#       ['', '', '']
#       ]

#       [
# ['O', 'X', ''],
# ['', '', ''],
# ['', '', '']
# ]


=begin
BFS or DFS algorithm

initial_state = [
['', '', ''],
['', '', ''],
['', '', '']
]

enumerated_states = []
queue = []
queue.push(initial_state)
until queue.empty?
    // queue.pop
    // go until the first empty spot
    // append the 2 game states into queue AND another array
    // next
end
=end
    
initial_state = [
['', '', ''],
['', '', ''],
['', '', '']
]

enumerated_states = []
queue = []
queue.push(initial_state)
until queue.empty?
    current_state = queue.pop
    pp current_state
    r = 0
    c = 0
    switch = true
    # finding first empty element
    until current_state[r][c] == ''
      r += 1 if switch
      c += 1 unless switch
      switch = !switch
    end
    current_state[r][c] = 'X'
    x = current_state
    queue.push(x)
    enumerated_states.push(x)

    current_state[r][c] = 'O'
    y = current_state
    queue.push(y)
    enumerated_states.push(y)
end

puts enumerated_states.length