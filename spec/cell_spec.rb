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
end
