require 'pry'
require './lib/ship'
require './lib/cell'

RSpec.describe Cell do

  it 'is a cell' do
    cell = Cell.new("B4")
    expect(cell).to be_instance_of(Cell)
  end
end
