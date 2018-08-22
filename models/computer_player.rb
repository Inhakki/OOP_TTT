require_relative 'player'

class ComputerPlayer < Player

  def open_the_pod_bay_doors
    puts "I believe I can't do that, David"
  end

  def handle_turn(grid)
    if grid.class == Grid
      move_made = false

      grid.grid.each_with_index do |row, r_index|
        row.each_with_index do |space, s_index|
          if space.nil?
            grid.occupy(s_index, r_index, self.character)
            move_made = true
            break
          end
        end
        break if move_made
      end
    end

    grid
  end
end