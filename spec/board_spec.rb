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
    expect(board.placement_length?(cruiser, ["A1", "A2", "A3"])).to eq(true)
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

  it 'valid placement for submarine is true' do
    board = Board.new
    cruiser = Ship.new("Cruiser", 3)
    submarine = Ship.new("Submarine", 2)
    #binding.pry
    expect(board.same_row?(submarine, ["A1", "A2"])).to eq(true)
  end

  it 'valid placement for cruiser is true' do
    board = Board.new
    cruiser = Ship.new("Cruiser", 3)
    submarine = Ship.new("Submarine", 2)
    #binding.pry
    expect(board.valid_placement?(cruiser, ["B1", "C1", "D1"])).to eq(true)
  end

  it 'placement length is working' do
    board = Board.new
    cruiser = Ship.new("Cruiser", 3)
    submarine = Ship.new("Submarine", 2)

    expect(board.placement_length?(cruiser, ["A1", "A2"])).to eq(false)
    expect(board.placement_length?(cruiser, ["A1", "A2", "A3"])).to eq(true)
    expect(board.placement_length?(submarine, ["A2", "A3", "A4"])).to eq(false)
    expect(board.placement_length?(submarine, ["A2", "A3"])).to eq(true)
  end

  it 'same row is working' do
    board = Board.new
    cruiser = Ship.new("Cruiser", 3)
    submarine = Ship.new("Submarine", 2)

    expect(board.same_row?(cruiser, ["A1", "A2", "A3"])).to eq(true)
    expect(board.same_row?(cruiser, ["A1", "B1", "C1"])).to eq(false)
    expect(board.same_row?(submarine, ["A2", "A3"])).to eq(true)
    expect(board.same_row?(submarine, ["B3", "A3"])).to eq(false)
  end

  it 'same column is working' do
    board = Board.new
    cruiser = Ship.new("Cruiser", 3)
    submarine = Ship.new("Submarine", 2)

    expect(board.same_column?(cruiser, ["A1", "B1", "C1"])).to eq(true)
    expect(board.same_column?(cruiser, ["B1", "B2", "C1"])).to eq(false)
    expect(board.same_column?(submarine, ["A2", "B2"])).to eq(true)
    expect(board.same_column?(submarine, ["A1", "B3"])).to eq(false)
  end

  it 'consecutive rows is working' do
    board = Board.new
    cruiser = Ship.new("Cruiser", 3)
    submarine = Ship.new("Submarine", 2)

    expect(board.consecutive_rows?(cruiser, ["A1", "A2", "A3"])).to eq(true)
    expect(board.consecutive_rows?(cruiser, ["B1", "B2", "B4"])).to eq(false)
    expect(board.consecutive_rows?(submarine, ["A2", "A3"])).to eq(true)
    expect(board.consecutive_rows?(submarine, ["A1", "A3"])).to eq(false)
  end

  it 'consecutive columns is working' do
    board = Board.new
    cruiser = Ship.new("Cruiser", 3)
    submarine = Ship.new("Submarine", 2)

    expect(board.consecutive_columns?(cruiser, ["A1", "B1", "C1"])).to eq(true)
    expect(board.consecutive_columns?(cruiser, ["A1", "A2", "A3"])).to eq(false)
    expect(board.consecutive_columns?(submarine, ["C2", "D2"])).to eq(true)
    expect(board.consecutive_columns?(submarine, ["A1", "D3"])).to eq(false)
  end

  it 'valid placement for cruiser is true' do
    board = Board.new
    cruiser = Ship.new("Cruiser", 3)
    submarine = Ship.new("Submarine", 2)

    expect(board.valid_placement?(cruiser, ["B1", "C1", "D1"])).to eq(true)
    #reverse order
    expect(board.valid_placement?(cruiser, ["A3", "A2", "A1"])).to eq(false)
  end

  it 'cell object accepts cruiser as its ship' do
    board = Board.new
    cruiser = Ship.new("Cruiser", 3)
    board.place(cruiser, ["A1", "A2", "A3"])
    cell_1 = board.cells["A1"]
    cell_2 = board.cells["A2"]
    cell_3 = board.cells["A3"]

    expect(cell_1 = board.cells["A1"]).to be_instance_of(Cell)
    expect(cell_3.ship == cell_2.ship).to eq(true)
    expect(cell_3.ship).to eq(cruiser)
  end

  it 'overlaping ships' do
    board = Board.new
    cruiser = Ship.new("Cruiser", 3)
    board.place(cruiser, ["A1", "A2", "A3"])
    submarine = Ship.new("Submarine", 2)
     cell_1 = board.cells["A1"]
     cell_2 = board.cells["A2"]
     cell_3 = board.cells["A3"]

    expect(board.valid_placement?(submarine, ["A1", "B1"])).to eq(false)
    expect(board.valid_placement?(submarine, ["A2", "A3"])).to eq(false)
  end

    it 'board render works' do
      board = Board.new
      cruiser = Ship.new("Cruiser", 3)
      board.place(cruiser, ["A1", "A2", "A3"])
      #board.render
      #submarine = Ship.new("Submarine", 2)

      board.render
      expect(board.cells["D1"].render).to eq(".")
      expect(board.cells["A1"].render(true)).to eq("S")
    end

    it 'next steps' do
      board = Board.new
      cruiser = Ship.new("Cruiser", 3)
      board.place(cruiser, ["A1", "A2", "A3"])
      #board.render
      #submarine = Ship.new("Submarine", 2)

      #board.render
      expect(board.render).to eq("  1 2 3 4 \nA . . . . \nB . . . . \nC . . . . \nD . . . . \n")
    end

    it 'board render true shows ships' do
      board = Board.new
      cruiser = Ship.new("Cruiser", 3)
      board.place(cruiser, ["A1", "A2", "A3"])

      expect(board.render(true)).to eq("  1 2 3 4 \nA S S S . \nB . . . . \nC . . . . \nD . . . . \n")
    end

    it 'cruiser is hit' do
      board = Board.new
      cruiser = Ship.new("Cruiser", 3)
      board.place(cruiser, ["A1", "A2", "A3"])
      cell_1 = board.cells["A1"]
      cell_2 = board.cells["A2"]
      cell_3 = board.cells["A3"]
      cell_1.fire_upon

      expect(board.render).to eq("  1 2 3 4 \nA H . . . \nB . . . . \nC . . . . \nD . . . . \n")
    end

    it 'missed shot' do
      board = Board.new
      cruiser = Ship.new("Cruiser", 3)
      board.place(cruiser, ["A2", "A3", "A4"])
      cell_1 = board.cells["A1"]
      cell_2 = board.cells["A2"]
      cell_3 = board.cells["A3"]
      cell_1.fire_upon

      expect(board.render).to eq("  1 2 3 4 \nA M . . . \nB . . . . \nC . . . . \nD . . . . \n")
      end

  it 'cruiser has sunk' do
    board = Board.new
    cruiser = Ship.new("Cruiser", 3)
    board.place(cruiser, ["A1", "A2", "A3"])
    cell_1 = board.cells["A1"]
    cell_2 = board.cells["A2"]
    cell_3 = board.cells["A3"]
    cell_1.fire_upon
    cell_2.fire_upon
    cell_3.fire_upon

    expect(board.render).to eq("  1 2 3 4 \nA X X X . \nB . . . . \nC . . . . \nD . . . . \n")
    end
end
