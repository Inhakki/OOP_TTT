require 'curses'
require 'terminal-table'
require 'byebug'

class GridView
#   def initialize(grid, player)
#     @player = player
#     setup_view(grid)
#   end
#
#   def setup_view(grid)
#     # http://blog.brandon-conway.com/blog/2013/12/31/using-ruby-curses/
#     Curses.noecho
#     Curses.cbreak
#     Curses.nonl
#     # Curses.raw
#     Curses.stdscr.nodelay = 1
#     Curses.stdscr.keypad(true)
#     Curses.init_screen
#     @posx = 0
#     @posy = 0
#
#     cols = grid.grid[0].length * 4
#     lines = grid.grid.length * 2
#     top = (Curses.lines / 2) - (lines / 2)
#     left = (Curses.cols / 2) - (cols / 2)
#
#     @window = Curses::Window.new(lines, cols, top, left)
#     @window << "#{@player.name}'s Turn'"
#     @window.box("|", "-")
#     # @window << Terminal::Table.new(rows: grid.grid)
#     handle_keyboard_input
#   end
#
#   def handle_keyboard_input
#     case @window.getch
#       when Curses::Key::UP
#         setpos([@posx - 1, @posy])
#       when Curses::Key::LEFT
#         setpos([@posx - 1, @posy])
#       when Curses::Key::RIGHT
#         setpos([@posx - 1, @posy])
#       when Curses::Key::DOWN
#         setpos([@posx - 1, @posy])
#       when ' '
#       when 'q'
#         exit(0)
#     end
#   end
#
#   def clear
#     Curses.close_screen
#   end
end
