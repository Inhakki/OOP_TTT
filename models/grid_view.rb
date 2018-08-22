require 'curses'

class GridView
  include Curses

  def initialize
    setup
  end

  def setup
    # http://blog.brandon-conway.com/blog/2013/12/31/using-ruby-curses/
    Curses.noecho
    Curses.cbreak
    Curses.nonl
    Curses.raw
    Curses.stdscr.nodelay = 1
    Curses.stdscr.keypad(true)
    Curses.init_screen
    Curses.start_color
    Curses.init_pair(1, Curses::COLOR_GREEN, Curses::COLOR_BLACK)
    Curses.init_pair(2, Curses::COLOR_BLACK, Curses::COLOR_GREEN)
    Curses.init_pair(3, Curses::COLOR_BLACK, Curses::COLOR_WHITE)
  end

  def show_grid_view(grid)
    cols = grid.grid[0].length
    lines = grid.grid.length

    @window = Window.new(lines, cols, 0, 0)
  end

  def clear

  end
end