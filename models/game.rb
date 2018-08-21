require_relative 'computer_player'
require_relative 'human_player'

class Game
  def initialize(player_number, grid_width, grid_height)
    @players = initialize_players(player_option)
    @grid = Grid.new(grid_width, grid_height)
    @current_turn = 0
  end

  def start
    game_steps
  end

  def current_status?
    @grid.grid
  end

  private

  def game_steps
    while !@grid.winner? || !@grid.cats_game

    end
  end

  def toggle_turns
    current_turn == 0 ? 1 : 0
  end

  def initialize_players(players)
    if players  == 1
      [HumanPlayer.new, ComputerPlayer.new].shuffle
    else
      [HumanPlayer.new, HumanPlayer.new]
    end
  end

  # def randomize_order
  #   if @players > 1
  #     @players.sample
  #   end
  # end

  def evaluate_turn
    unless @grid.winner?
      @turn += 1
    end
  end
end