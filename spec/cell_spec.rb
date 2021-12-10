require 'pry'
require './lib/ship'
require './lib/cell'

RSpec.describe Cell do
  it 'is a cell' do
    cell = Cell.new("B4")

    expect(cell).to be_instance_of(Cell)
  end

  it 'coordinate equals B4' do
    cell = Cell.new("B4")

    expect(cell.coordinate).to eq("B4")
  end

  it 'ship equals nil' do
    cell = Cell.new("B4")

    expect(cell.ship).to eq(nil)
  end

  it 'cell is empty' do
    cell = Cell.new("B4")

    expect(cell.empty?).to eq(true)
  end

  it 'cell ship to be a cruiser' do
    cell = Cell.new("B4")
    cruiser = Ship.new("Cruiser", 3)
    cell.place_ship(cruiser)

    expect(cell.ship).to eq(cruiser)
  end

  it 'cell empty to be false' do
    cell = Cell.new("B4")
    cruiser = Ship.new("Cruiser", 3)
    cell.place_ship(cruiser)

    expect(cell.empty?).to eq(false)
  end

  it 'cell fired upon to be false' do
    cell = Cell.new("B4")
    cruiser = Ship.new("Cruiser", 3)
    cell.place_ship(cruiser)

    expect(cell.fired_upon?).to eq(false)
  end

  it 'cell ship health to eq 2' do
    cell = Cell.new("B4")
    cruiser = Ship.new("Cruiser", 3)
    cell.place_ship(cruiser)
    cell.fire_upon

    expect(cell.ship.health).to eq(2)
  end

  it 'cell fired upon to be true' do
    cell = Cell.new("B4")
    cruiser = Ship.new("Cruiser", 3)
    cell.place_ship(cruiser)
    cell.fire_upon

    expect(cell.fired_upon?).to eq(true)
  end

  it 'render "."' do
    cell_1 = Cell.new("B4")

    expect(cell_1.render).to eq(".")


  end

  it 'render "M"' do
    cell_1 = Cell.new("B4")
    cell_1.fire_upon

    expect(cell_1.render).to eq("M")
  end

  it 'render cell_2 to eq "."' do
    cell_1 = Cell.new("B4")
    cell_2 = Cell.new("C3")
    cruiser = Ship.new("Cruiser", 3)
    cell_1.fire_upon
    cell_2.place_ship(cruiser)

    expect(cell_2.render).to eq(".")
  end

  it 'render cell_2 to true"' do
    cell_1 = Cell.new("B4")
    cell_2 = Cell.new("C3")
    cruiser = Ship.new("Cruiser", 3)
    cell_1.fire_upon
    cell_2.place_ship(cruiser)

    expect(cell_2.render(true)).to eq("S")
  end

  it 'render cell_2 to eq "H", sunk is false' do
    cell_1 = Cell.new("B4")
    cell_2 = Cell.new("C3")
    cruiser = Ship.new("Cruiser", 3)
    cell_1.fire_upon
    cell_2.fire_upon
    cell_2.place_ship(cruiser)

    expect(cell_2.render).to eq("H")
    expect(cruiser.sunk?).to eq(false)
  end

  it 'render cell_2 to eq "X", sunk true' do
    cell_1 = Cell.new("B4")
    cell_2 = Cell.new("C3")
    cruiser = Ship.new("Cruiser", 3)
    cell_1.fire_upon
    cell_2.place_ship(cruiser)
    cell_2.fire_upon
    cruiser.hit
    cruiser.hit

    expect(cruiser.sunk?).to eq(true)
    expect(cell_2.render).to eq("X")
  end
end
