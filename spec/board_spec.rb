require 'pry'
require './lib/ship'
require './lib/cell'
require './lib/board'

RSpec.describe Board do
  it 'exists' do
    board = Board.new

    expect(board).to be_instance_of(Board)
  end

  it 'cells - creates 16 cells' do
    board = Board.new

    expect(board.cells.keys.count).to eq(16)
    expect(board.cells).to be_a(Hash)
    expect(board.cells.values[0]).to be_a(Cell)
  end

  it 'valid coordinate passes' do
    board = Board.new

    expect(board.valid_coordinate?("A1")).to eq(true)
    expect(board.valid_coordinate?("D4")).to eq(true)
    expect(board.valid_coordinate?("A5")).to eq(false)
    expect(board.valid_coordinate?("E1")).to eq(false)
    expect(board.valid_coordinate?("A22")).to eq(false)
  end

  it 'valid placement for ships is false as tested' do
    board = Board.new
    cruiser = Ship.new("Cruiser", 3)
    submarine = Ship.new("Submarine", 2)

    expect(board.valid_placement?(cruiser, ["A1", "A2"])).to eq(false)
    expect(board.valid_placement?(submarine, ["A2", "A3", "A4"])).to eq(false)
  end

  it 'valid placement coords are consecutive is false' do
    board = Board.new
    cruiser = Ship.new("Cruiser", 3)
    submarine = Ship.new("Submarine", 2)
    # binding.pry
    expect(board.valid_placement?(cruiser, ["A1", "A2", "A4"])).to eq(false)
  end

  it 'valid placement coords are consecutive is true' do
    board = Board.new
    cruiser = Ship.new("Cruiser", 3)
    submarine = Ship.new("Submarine", 2)
    # binding.pry
    expect(board.valid_placement?(submarine, ["A1", "C1"])).to eq(false)
  end

  it 'valid placement for cruiser is false' do
    board = Board.new
    cruiser = Ship.new("Cruiser", 3)
    submarine = Ship.new("Submarine", 2)
    # binding.pry
    expect(board.valid_placement?(cruiser, ["A3", "A2", "A1"])).to eq(false)
  end

  it 'valid placement for submarine is false' do
    board = Board.new
    cruiser = Ship.new("Cruiser", 3)
    submarine = Ship.new("Submarine", 2)
    # binding.pry
    expect(board.valid_placement?(submarine, ["C1", "B1"])).to eq(false)
  end


end
