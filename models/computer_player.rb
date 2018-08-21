require_relative 'player'

class ComputerPlayer < Player

  def open_the_pod_bay_doors
    puts "I believe I can't do that, David"
  end


  def handle_turn(grid)
    if grid.class == Grid
      byebug
    end
  end
end