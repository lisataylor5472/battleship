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
    if ship.length == coords.length && coords.map { |coord| coord[1].to_i } == (coords[0][1].to_i..coords[0][1].to_i+1).to_a
      # consecutive_coords?(coords)
      true
    # elsif   # the coordinates are consecutive horizontally
    # elsif c.map { |coord| coord[1] } == [c[0][1], (c[0][1]+1), (c[0][1]+2)]
    else
      false
      # digits_only = []
      # coordinates.each do |coordinate|
      #   digits_only << coordinate[1]
      #   digits_only.each_cons(ship.length) ==
      # digits_only = []
      # coordinates.each do |coordinate|
      #   digits_only << coordinate[1]
      #   if digits_only == (coordinates.min..coordinates.max).to_a
      #     true
      #   end
      # coordinates.ord.all
    end
  end
                                # c = ["A1", "A2", "A4"]   ["1", "2", "4"]
  # def consecutive_coords?(coords)
  #   if coords.map { |coord| coord[1] } == [coords[0][0].to_s, coords[0][0]+1.to_s, coords[0][0]+2.to_s]
  #   end
  # end

end





# elsif the coords are cons horiz
# if coordinate ints == [coord[0][0], (coord[0][0] + 1), (coord[0][0]+2)]
# elsif coordinates.map { |coord| coord[1] } == [c[0][0], (c[0][0]+1), (c[0][0]+2)]
