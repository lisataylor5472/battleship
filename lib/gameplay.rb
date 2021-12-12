class Gameplay
  attr_reader :computer_player, :user, :user_board, :computer_player_board

  def initialize
    puts "Welcome to BATTLESHIP"
    puts "Enter p to play. Enter q to quit."
    @computer_player = computer_player
    @user = user
    @computer_player_board = Board.new
    @user_board = Board.new
  end

  def start_or_quit(p_or_q)
    if p_or_q == "p"
      puts "Okay let's play!"
    elsif p_or_q == "q"
      puts "Maybe next time!"
    end
  end

  def input_coords(gets_coords)
    placement_coords = gets_coords.split(" ").to_a
  end


  def user_place_ship(ship, gets_coords)
    #computer_player ship placement is autogenerated by computer
    placement_coords = gets_coords.split(" ").to_a
    if @user_board.valid_placement?(ship, placement_coords) == true
      @user_board.place(ship, placement_coords)
    elsif @user_board.valid_placement?(ship, placement_coords) == false
      puts "Those are invalid coordinates. Please try again:"
      user_place_ship(ship, gets.chomp)
    end
  end

  def computer_place_ship(ship)
    a = random_coords(ship)
    if @computer_player_board.valid_placement?(ship, a) == true
      @computer_player_board.place(ship, a)
    elsif @computer_player_board.valid_placement?(ship, a) == false
      computer_place_ship(ship)
    end
  end

  def random_coords(ship)
    @computer_player_board.cells.keys.sample(ship.length)
  end
end
