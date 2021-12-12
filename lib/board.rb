require 'pry'\

class Board
  attr_reader :cells

  def initialize
    @cells = {
    "A1" => Cell.new("A1"),
    "A2" => Cell.new("A2"),
    "A3" => Cell.new("A3"),
    "A4" => Cell.new("A4"),
    "B1" => Cell.new("B1"),
    "B2" => Cell.new("B2"),
    "B3" => Cell.new("B3"),
    "B4" => Cell.new("B4"),
    "C1" => Cell.new("C1"),
    "C2" => Cell.new("C2"),
    "C3" => Cell.new("C3"),
    "C4" => Cell.new("C4"),
    "D1" => Cell.new("D1"),
    "D2" => Cell.new("D2"),
    "D3" => Cell.new("D3"),
    "D4" => Cell.new("D4")
    }
  end

  def valid_coordinate?(arg)
    if @cells.keys.include?(arg)
      true
    else
      false
    end
  end

  def valid_placement?(ship, coords)
    placement_length?(ship, coords) &&
    (same_row?(ship, coords) || same_column?(ship, coords)) &&
    (consecutive_rows?(ship, coords) || consecutive_columns?(ship, coords)) &&
    overlap?(ship,coords)
  end

  def overlap?(ship, coords)
    coords.each do |coord|
        if @cells[coord].ship == nil
          return true
        else
          return false
        end
      end
  end

  def placement_length?(ship, coords)
    ship.length == coords.size
  end

  def same_row?(ship, coords)
    letters = coords.map { |coord| coord[0] }
    letters.uniq.count == 1
  end

  def same_column?(ship, coords)
    numbers = coords.map { |coord| coord[1] }
    numbers.uniq.count == 1
  end

  def consecutive_rows?(ship, coords)
    numbers = coords.map { |coord| coord[1].to_i }
    valid_options = (1..4).each_cons(ship.length).to_a
    valid_options.any?(numbers)
  end

  def consecutive_columns?(ship, coords)
    letters = coords.map { |coord| coord[0] }
    valid_options = ("A".."D").each_cons(ship.length).to_a
    valid_options.any?(letters)
  end

  def place(ship, coords)

    coords.each do |coord|
      @cells[coord].place_ship(ship)

    end
  end

  def render(arg = false)
  #binding.pry
  return "  1 2 3 4 \n" +
 "A" + " " + @cells["A1"].render(arg) + " " + @cells["A2"].render(arg) + " " + @cells["A3"].render(arg) + " " + @cells["A4"].render(arg) + " \n"  +
 "B" + " " + @cells["B1"].render(arg) + " " + @cells["B2"].render(arg) + " " + @cells["B3"].render(arg) + " " + @cells["B4"].render(arg) + " \n"  +
 "C" + " " + @cells["C1"].render(arg) + " " + @cells["C2"].render(arg) + " " + @cells["C3"].render(arg) + " " + @cells["C4"].render(arg) + " \n"  +
 "D" + " " + @cells["D1"].render(arg) + " " + @cells["D2"].render(arg) + " " + @cells["D3"].render(arg) + " " + @cells["D4"].render(arg) + " \n"

  end
end
