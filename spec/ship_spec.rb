require 'pry'
require './lib/ship'

RSpec.describe Ship do

  it 'is a cruiser' do
    cruiser = Ship.new("Cruiser", 3)
    expect(cruiser).to be_instance_of(Ship)
  end

end
