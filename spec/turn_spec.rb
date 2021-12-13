require 'pry'
require './lib/ship'
require './lib/cell'
require './lib/board'
require './lib/gameplay'
require './lib/turn'

RSpec.describe Turn do
  it 'exists' do
    turn = Turn.new
  expect(turn).to be_instance_of(Turn)
  end
end
