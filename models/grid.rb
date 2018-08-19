class Grid

  def initialize(grid_width, grid_height)
    @grid= build_grid(grid_width, grid_height)
  end

  def winner?

  end

  private

  def build_grid(width, height)
    grid = []
    row = []

    width.times do |c|
      row << nil
    end


  end


  def evaluate_row
    # @grid_values.each do |row|
    #   row.
    # end
  end

  def evaluate_column
    # @grid_values.each do |row|
    #
    # end
  end
end