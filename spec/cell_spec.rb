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

end
