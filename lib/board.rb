require 'pry'
class Board
  def initialize
  end

  def cells # so cute
    {
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
    if cells.keys.include?(arg)
      true
    else
      false
    end
  end

  def valid_placement?(ship, coords)
    a = coords.map { |coord| coord[1].to_i }
    b = (1..4).each_cons(3) { |a| a }
    if ship.length == coords.length && a.any?(b) == true
    else
      return false#&& consecutive?(coords) == true
    end
  end

  # def consecutive(coords)
  #   # same row
  #   if coords.map { |coord| coord[1].to_i } == (coords[0][1].to_i..coords[0][1].to_i+1).to_a
  #     # same column
  #   elsif coords.map { |coord| coord[1] } == coords.map { |coord| coord[1] }
  #   else
  #     false
  #     # if same_row(coords) == true || same_column(coords) == true
  #   # else
  #   #   false
  #   end
  # end


  def same_row(coords)
    if coords.map { |coord| coord[1].to_i } == (1..4).each_cons()
      return true
    else
      return false
    end
  end
  #
  # def same_column(coords)
  #   if coords.map { |coord| coord[0] } == (coords[0][0]..coords[-1][0]).to_a
  #     true
  #   else
  #     false
  #   end
  # end
end
