class Cell
  attr_reader :coordinate, :ship, :fired_upon #render

  def initialize(coordinate)#render = ".")
    @coordinate = coordinate
    @ship = nil
    #@render = render
    @fired_upon = false
  end

  def place_ship(picked_ship)
    @ship = picked_ship
    #if @render == true
    #@render = "S"
    #end
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
    else
    "."
    end
  end

#  def fire_upon  # our "." and "S" can be included in this if statemnet(conditional), google how to add an optional argument
#    if @ship == nil # remeber we dont have an instance variable for render anymore.
#      @render = "M"
#    elsif @ship != nil
#      @render = "H"
#      @ship.hit
#    elsif @ship.sunk? == true
#      @render = "X"
#    end
#  end

#fire upon method know doesnt exist and needs to be created. /zzzzzzzz

#### this method may be questionable?
  #def fired_upon?
  #  if @ship.health < @ship.length
  #    true
  #  else
  #    false
  #  end
  #end

  #def render(true)
  #  @render = "S"
  #end
end
