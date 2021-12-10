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


end
