# 'pry'
require './lib/ship'
require './lib/cell'
require './lib/board'
require './lib/gameplay'

# computer_player = Player.new
# user_player = Player.new
game_1 = Gameplay.new

# board = Board.new
# cruiser = Ship.new("Cruiser", 3)
# submarine = Ship.new("Submarine", 2)

game_1.start
