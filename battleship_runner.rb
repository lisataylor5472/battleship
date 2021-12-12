require 'pry'
require './lib/ship'
require './lib/cell'
require './lib/board'
require './lib/gameplay'

game_1 = Gameplay.new
board = Board.new
cruiser = Ship.new("Cruiser", 3)
submarine = Ship.new("Submarine", 2)

game_1.start_or_quit(gets.chomp)
puts "I have laid out my ships on the grid."
puts "You now need to lay out your two ships"
puts "The Cruiser is three units long and the Submarine is two units long."
puts board.render
puts "Enter the squares for the Cruiser (3 spaces):"
game_1.place_ship(gets.chomp)
