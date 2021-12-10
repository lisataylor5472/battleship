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

  it 'valid coordinate A1 is true' do
    board = Board.new

    expect(board.valid_coordinate?("A1")).to eq(true)
    expect(board.valid_coordinate?("D4")).to eq(true)
    expect(board.valid_coordinate?("A5")).to eq(false)
    expect(board.valid_coordinate?("E1")).to eq(false)
    expect(board.valid_coordinate?("A22")).to eq(false)


  end
end
