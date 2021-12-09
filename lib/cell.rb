class Cell
  attr_reader :coordinate, :ship, :render

  def initialize(coordinate)
    @coordinate = coordinate
    @ship = nil
    @render = "."
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

  def fire_upon
    if @ship == nil
      @render = "M"
    elsif @ship != nil
      @render = "H"
      @ship.hit
    elsif @ship.sunk? == true
      @render = "X"
    end
  end

#### this method may be questionable?
  def fired_upon?
    if @ship.health < @ship.length
      true
    else
      false
    end
  end
end
