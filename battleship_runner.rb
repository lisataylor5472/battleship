require 'pry'
require './lib/ship'
require './lib/cell'
require './lib/board'
require './lib/gameplay'

game_1 = Gameplay.new
# board = Board.new
cruiser = Ship.new("Cruiser", 3)
submarine = Ship.new("Submarine", 2)

game_1.start_or_quit(gets.chomp)

game_1.computer_place_ship(cruiser)
game_1.computer_place_ship(submarine)

puts "I have laid out my ships on the grid."
puts "You now need to lay out your two ships"
puts "The Cruiser is three units long and the Submarine is two units long."
puts game_1.user_board.render
puts "Enter the squares for the Cruiser (3 spaces):"
game_1.user_place_ship(cruiser, gets.chomp)

puts game_1.user_board.render(true)

puts "Enter the squares for the Submarine (2 spaces):"
game_1.user_place_ship(submarine, gets.chomp)

puts game_1.user_board.render(true)

# puts game_1.computer_player_board.render(true)
