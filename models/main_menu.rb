require 'tty-prompt'
require 'byebug'
require_relative 'game'

class MainMenu
  def start
    prompt = TTY::Prompt.new

    player_number = prompt.select("Tic Tac Toe! How many players?", {"One Player" => 1, "Two Player" => 2})
    grid_range = (3..30).to_a
    dimension = prompt.select("choose grid size (3-30)", grid_range)

    #TODO: Allow people to make rectangular grids
    Game.new(player_number, dimension, dimension).start
  end
end