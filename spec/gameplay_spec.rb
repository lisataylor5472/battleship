require 'pry'
require './lib/ship'
require './lib/cell'
require './lib/board'
require './lib/gameplay'

RSpec.describe Gameplay do
  it 'exists' do
    game_1 = Gameplay.new

    expect(game_1).to be_instance_of(Gameplay)
  end
end
