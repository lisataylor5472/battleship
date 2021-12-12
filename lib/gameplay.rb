class Gameplay
  def initialize
    puts "Welcome to BATTLESHIP"
    puts "Enter p to play. Enter q to quit."
  end

  def start_or_quit(p_or_q)
    if p_or_q == "p"
      puts "Okay let's play!"
    elsif p_or_q == "q"
      puts "Maybe next time!"
    end
  end

end
