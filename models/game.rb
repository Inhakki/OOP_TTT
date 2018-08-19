class Game

  def initialize(player_number, grid_width, grid_height)
    @players = initialize_players(player_option)
    @grid = Grid.new(grid_width, grid_height)
  end



  private

  def initialize_players(players)
    if players  == 1
      [Player.create('human'), Player.create('computer')]
    else
      [Player.create('human'), Player.create('human')]
    end
  end

  def evaluate_turn
    unless @grid.winner?

    end
  end
end