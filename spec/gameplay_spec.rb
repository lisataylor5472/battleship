require 'pry'
require './lib/ship'
require './lib/cell'
require './lib/board'
require './lib/gameplay'

RSpec.describe Gameplay do
  it 'exists' do
    game_1 = Gameplay.new

    expect(game_1).to be_instance_of(Gameplay)
  end

  it 'input coords creating ["A1", "A2", "A3"]' do
    game_1 = Gameplay.new
    cruiser = Ship.new("Cruiser", 3)
    cell_1 = game_1.computer_player_board.cells["A1"]

    expect(game_1.input_coords("A1 A2 A3")).to eq(["A1", "A2", "A3"])
  end

  it 'input coords creating ["A1", "A2", "A3"]' do
    game_1 = Gameplay.new
    cruiser = Ship.new("Cruiser", 3)
    cell_1 = game_1.computer_player_board.cells["A1"]

    expect(game_1.input_coords("A1 A2 A3")).to eq(["A1", "A2", "A3"])
  end
end
