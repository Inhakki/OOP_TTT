require 'byebug'

class Grid

  attr_accessor :grid

  def initialize(grid_width, grid_height)
    @height = grid_height
    @grid = build_grid(grid_width, grid_height)
  end

  def occupy(x_axis, y_axis, character)
    if @grid[y_axis][x_axis]
      raise "Invalid, that space is already taken"
    end

    @grid[y_axis][x_axis] = character
  end

  def winner?
    if evaluate_row || evaluate_column
      return true
    end

    false
  end

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

    @height.times do |h_unit|
      column = []
      @grid.each do |row|
        column << row[h_unit]
      end

      if all_mono_char?(column)
        winner_exists = true
        return winner_exists
      end
    end

    winner_exists
  end

  private

  def all_mono_char?(arr)
    if arr.all?(:x) || arr.all?(:o)
      return true
    end
    false
  end

  def build_grid(width, height)
    grid = []

    height.times do |h_unit|
      row = []
      width.times do |w_unit|
        row << nil
      end
      grid << row
    end

    grid
  end


end