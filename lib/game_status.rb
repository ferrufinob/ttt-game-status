# Helper Method
require "pry"

def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
# 0 | 1 | 2
#__________
# 3 | 4 | 5
#__________
# 6 | 7 | 8
WIN_COMBINATIONS = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 4, 8], [2, 4, 6], [0, 3, 6], [1, 4, 7], [2, 5, 8]]

def won?(board)
  #  we want to return the winning combination if there is one
  # return false otherwise
  # go through each one and check them
  # use an iterator

  WIN_COMBINATIONS.detect do |win_combination|
    # check what we are gettign back
    # another array, one at a time
    # how will I know if this is a winning combination? if they are all the same
    #  detect find matching element on a collection based on a block
    #  when you pass in a chunk of code
    # if that code evaluates to true i will get whatever element im on passed back
    #  look at every win combination where its all equal and pass that back
    # make dynamic by passing win_combination
    location1 = win_combination[0]
    location2 = win_combination[1]
    location3 = win_combination[2]
    # whenever the board location is on that win combination are all equal, make sure they are not all blank
    board[location1] == board[location2] && board[location2] == board[location3] && position_taken?(board, location1) #makes sure position [1,2,3] are all the same
    # if everything is the same but nobody won if they are all blank
    #
  end
end

def full?(board)
  # check if any of them are blank
  board.all? { |token| token == "X" || token == "O" }
end

def draw?(board)
  full?(board) && !won?(board)
end

def over?(board)
  won?(board) || full?(board)
end

def winner(board)
  if winning_combo = won?(board)
    board[winning_combo.first]
  end
end
