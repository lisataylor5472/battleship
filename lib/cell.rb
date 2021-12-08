class Cell
  attr_reader :coordinate, :ship

  def initialize(coordinate)
    @coordinate = coordinate
    @ship = nil
  end

  def place_ship(picked_ship)
    @ship = picked_ship
  end

  def empty?
    if @ship == nil
      true
    else
      false
    end
  end
end
