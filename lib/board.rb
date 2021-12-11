require 'pry'
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
  #
  # def valid_placement?(ship, coords)
  #   if (placement_length?(ship, coords) == true) && (same_row?(ship, coords) == true)
  #   else
  #     false
  #   end
  # end

  def placement_length?(ship, coords)
    ship.length == coords.size
  end

  def same_row?(ship, coords)
    a = coords.map { |coord| coord[0] }
    a.uniq.count == 1
  end

  def same_column?(coords)
  end


end

# may need this for column? compares valid integers
# c = []
# nums = coords.map { |coord| coord[1].to_i }
# b = (1..4).each_cons(ship.length).to_a
# nums.none?(b) == true
