require 'byebug'

class Grid
  attr_accessor :grid

  def initialize(grid_width, grid_height)
    @height = grid_height
    @width = grid_width
    @grid = build_grid(grid_width, grid_height)
  end

  def occupy(x_axis, y_axis, character)
    if @grid[y_axis][x_axis]
      raise "Invalid, that space is already taken"
    end

    @grid[y_axis][x_axis] = character
  end

  def winner?
    if evaluate_row_for_win || evaluate_column_for_win || evaluate_diagonals_for_win
      return true
    end

    false
  end

  def cats_game?
    @grid.grid.compact.none?(nil)
  end

  private

  def evaluate_row_for_win
    winner_exists = false

    @grid.each do |row|
      if all_mono_char?(row)
        winner_exists = true
        return winner_exists
      end
    end

    winner_exists
  end

  def evaluate_column_for_win
    winner_exists = false

    @height.times do |h_index|
      column = []
      @grid.each do |row|
        column << row[h_index]
      end

      if all_mono_char?(column)
        winner_exists = true
        return winner_exists
      end
    end

    winner_exists
  end

  def evaluate_diagonals_for_win
    winner_exists = false

    #only evaluate if height and width are same.
    if @height == @width

      @height.times do |h_index|
        diagonal_left_start = []
        diagonal_right_start = []
        index_adder = 0

        @grid.each do |row|
          diagonal_left_start << row[h_index + index_adder]
          diagonal_right_start << row[-(h_index) - index_adder +1]


          index_adder += 1
        end

        # #TODO fix this
        puts diagonal_left_start.join(',')
        puts diagonal_right_start.join(',')
        # puts all_mono_char?(diagonal_right_start)
        # puts all_mono_char?(diagonal_left_start)

        if all_mono_char?(diagonal_left_start) || all_mono_char?(diagonal_right_start)
          winner_exists = true
          return winner_exists
        end
      end
    end

    winner_exists
  end

  def all_mono_char?(arr)
    if arr.all?(:x) || arr.all?(:o)
      return true
    end
    false
  end

  def build_grid(width, height)
    grid = []

    height.times do |h_index|
      row = []
      width.times do |w_unit|
        row << nil
      end
      grid << row
    end

    grid
  end
end