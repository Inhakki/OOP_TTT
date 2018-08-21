require 'tty-table'

class GridView
  include Vedeu

  def show_grid_view(grid)

    interface :grid do
      centred true
      text "Test Grid"
    end
  end
end