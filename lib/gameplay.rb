require 'pry'
class Gameplay
  attr_reader :user_board,
              :computer_player_board


  def initialize
    @user_cruiser = Ship.new("Cruiser", 3)
    @computer_cruiser = Ship.new("Cruiser", 3)
    @user_submarine = Ship.new("Submarine", 2)
    @computer_submarine = Ship.new("Submarine", 2)
    @computer_ships_sunk = 0
    @user_ships_sunk = 0
    @computer_player_board = Board.new
    @user_board = Board.new

  end

  def start
    puts "Welcome to Battleship!!!"
    puts  "                           # #  ( ) \n" +
          "                        ___#_#___|__\n" +
          "                    _  |____________|  _\n" +
          "             _=====| | |   o    o   | | |==== _\n" +
          "       =====| |.---------------------------. | |====           \n" +
          "<--------------------'   .  .  .  .  .  .  .  .   '--------------/ \n" +
          "  [{        o            o                SS Becky and Lisa      / \n" +
          "   [{_______________________________________________WWS_________/ \n" +
          "wwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwww\n" +
          "wwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwww\n" +
          "wwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwww"
    puts "Enter p to play. Enter q to quit."

    input = gets.chomp
      if input == 'p'

        computer_place_ship(@computer_cruiser)
        computer_place_ship(@computer_submarine)

        puts "I have laid out my ships on the grid."
        puts "You now need to lay out your two ships"
        puts "The Cruiser is three units long and the Submarine is two units long."

        puts "#{user_board.render}" +
            "Enter the squares for the Cruiser (3 spaces):"

        user_place_ship(@user_cruiser, gets.chomp)

        puts "#{user_board.render(true)}" +
              "Enter the squares for the Submarine (2 spaces):"

        user_place_ship(@user_submarine, gets.chomp)

        puts "#{user_board.render(true)}"

        while game_over? == false
          take_turn
        end

          if @computer_ships_sunk == 2
          puts "****************************************"
          puts "*********YOU ARE THE WINNER!!!**********"
          puts "****************************************"
          elsif @user_ships_sunk == 2
          puts "****************************************"
          puts "*********YOU ARE THE LOSER!!!***********"
          puts "****************************************"
          end
    else exit
    end
        @computer_player_board = Board.new
        @user_board = Board.new
        @user_cruiser = Ship.new("Cruiser", 3)
        @computer_cruiser = Ship.new("Cruiser", 3)
        @user_submarine = Ship.new("Submarine", 2)
        @computer_submarine = Ship.new("Submarine", 2)
        @computer_ships_sunk = 0
        @user_ships_sunk = 0
        start

  end

  def game_over?
        @computer_ships_sunk == 2 || @user_ships_sunk == 2
  end

  def input_coords(gets_coords)
    placement_coords = gets_coords.split(" ").to_a
  end


  def user_place_ship(ship, gets_coords)

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

  def take_turn
    puts "=============COMPUTER BOARD============="
    puts "#{@computer_player_board.render}"
    puts "==============PLAYER BOARD=============="
    puts "#{@user_board.render(true)}"

    puts "Enter the coordinate for your shot:"
    user_fires

    computer_fires
  end

  def user_fires
    input = gets.chomp
      if @computer_player_board.cells.keys.any?(input) == true && @computer_player_board.cells[input.to_s].fired_upon? == false
        cell = @computer_player_board.cells[input.to_s]
        cell.fire_upon
          if cell.ship != nil && cell.ship.sunk?
            # "X"
            puts "Your shot on #{input} was a hit! And you sunk my #{cell.ship.name}!!"
            @computer_ships_sunk +=1
          elsif cell.fired_upon? && cell.ship != nil && cell.ship.sunk? == false
            # "H"
            puts "Your shot on #{input} was a hit!"
          elsif cell.fired_upon? == true
            # "M"
            puts "Your shot on #{input} was a miss!"
          end
      else
        puts "Please enter a valid coordinate that has not been fired upon:"
        user_fires
      end
  end

  def computer_fires
    selected_coord = @user_board.cells.keys.sample(1)
    cell = @user_board.cells[selected_coord[0]]
      if cell.fired_upon? == false
         cell.fire_upon
         if cell.ship != nil && cell.ship.sunk?
           # "X"
           puts "My shot on #{selected_coord[0]} was a hit! And I sunk your #{cell.ship.name}!!"
           @user_ships_sunk +=1
         elsif cell.fired_upon? && cell.ship != nil
           # "H"
           puts "My shot on #{selected_coord[0]} was a hit!"
         elsif cell.fired_upon? == true
           # "M"
           puts "My shot on #{selected_coord[0]} was a miss!"
         end
      else
        computer_fires
      end
  end
end
