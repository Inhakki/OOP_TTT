require 'terminal-table'
require 'tty-prompt'
require 'byebug'

class GridInterface
  def initialize(grid)
    @grid = grid
    @prompt = TTY::Prompt.new
    prep_coordinate_headers
  end

  def render_view
    @prepped_grid = prep_grid_for_view
    table = Terminal::Table.new do |t|
      @prepped_grid.each do |row|
        t.add_row(row)
      end
      t.style = {:all_separators => true}
    end

    puts table
  end

  def render_movable_view(player)
    puts "#{player.name}'s turn"
    render_view
    @unconfirmed = true

    while @unconfirmed do
      number_select = @first_row
      number_select.shift
      letter_select = @first_column.slice(0..@grid.grid.length - 1)

      column_index = @prompt.select("Make a move, select a number for the column you want to place", number_select)
      row_index = @prompt.select("Now select a row letter", letter_select)

      @unconfirmed = @prompt.select("Done, or reselect?", {"Done" => false, "select again" => true})
    end

    calculate_correct_coordinates_from_view(row_index, column_index)
  end

  private

  def prep_grid_for_view
    new_grid = @grid.grid.map.with_index do |row, index|
      new_row = row.map do |space|
        if space.nil?
          " "
        elsif space == :x
          "X"
        else
          "O"
        end
      end
      new_row.unshift(@first_column[index])
      new_row
    end

    new_grid.unshift(@first_row)
    new_grid
  end

  def prep_coordinate_headers
    # first character needs to be blank
    @first_row = (0..@grid.grid.length - 1).to_a.unshift(' ')

    # add additionals for 26+, need to fix this later
    @first_column = ('a'..'z').to_a + ['aa', 'bb', 'cc', 'dd', 'ee']
  end

  def calculate_correct_coordinates_from_view(row_index, column_index)
    { x: @first_row.index(column_index), y: @first_column.index(row_index) }
  end
end