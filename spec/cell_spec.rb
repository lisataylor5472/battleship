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
    #cell = Cell.new("B4")
    #cruiser = Ship.new("Cruiser", 3)
    #cell.place_ship(cruiser)
    #cell.fire_upon
    cell_1 = Cell.new("B4")
    expect(cell_1.render).to eq(".")
    #cell_1.fire_upon

  end

  it 'render "M"' do
    #cell = Cell.new("B4")
    #cruiser = Ship.new("Cruiser", 3)
    #cell.place_ship(cruiser)
    #cell.fire_upon
    cell_1 = Cell.new("B4")
    cell_1.fire_upon
    #cell_1.fire_upon
    expect(cell_1.render).to eq("M")
  end
end
