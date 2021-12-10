class Cell
  attr_reader :coordinate, :ship, :fired_upon

  def initialize(coordinate)
    @coordinate = coordinate
    @ship = nil
    @fired_upon = false
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

  def fired_upon?
    @fired_upon
  end

  def fire_upon
    @ship.hit if empty? == false
  @fired_upon = true
  end

  def render(arg = false)
    if @ship != nil && @ship.sunk?
    "X"
    elsif fired_upon? && @ship != nil
    "H"
    elsif fired_upon? == true
    "M"
    elsif @ship != nil && arg
    "S"
    else
    "."
    end
  end
end
