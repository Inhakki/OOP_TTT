require_relative 'player'
require_relative 'grid_interface'
require 'byebug'

class HumanPlayer < Player

  def handle_turn(grid)
    if grid.class == Grid
      move = GridInterface.new(grid).render_movable_view(self)
      move_made = grid.occupy(move[:x], move[:y], self.character)

      #boolean tells Game that move was properly made
      move_made
    end
  end

end