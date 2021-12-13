require 'pry'
require './lib/ship'
require './lib/cell'
require './lib/board'
require './lib/gameplay'
require './lib/turn'
require './lib/player'


RSpec.describe Player do
  it 'exists' do
    player = Player.new
  expect(player).to be_instance_of(Player)
  end  
end
