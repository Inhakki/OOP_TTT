require_relative 'computer_player'
require_relative 'human_player'

class Game
  def initialize(player_number, grid_width, grid_height)
    @players = initialize_players(player_option)
    @grid = Grid.new(grid_width, grid_height)
    @turn = 0
    @starting_player = randomize_order
  end

  def start

  end

  def current_status?
    @grid.grid
  end

  private

  def initialize_players(players)
    if players  == 1
      [HumanPlayer.new, ComputerPlayer.new]
    else
      [HumanPlayer.new, HumanPlayer.new]
    end
  end

  def randomize_order
    if @players > 1
      @players.sample
    end
  end

  def evaluate_turn
    unless @grid.winner?
      @turn += 1
    end
  end
end