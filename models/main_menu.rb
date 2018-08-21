require 'tty-prompt'
require 'byebug'
require_relative 'game'

class MainMenu
  def start
    menu_prompt = TTY::Prompt.new

    player_number = menu_prompt.select("Tic Tac Toe! How many players?", {"One Player" => 1, "Two Player" => 2})
    grid_range = (3..30).to_a
    dimension = menu_prompt.select("choose grid size (3-30)", grid_range)
    character_select = menu_prompt.select("Player 1: X or O?", { "X" => :x, "O" => :o})

    #TODO: Allow people to make rectangular grids
    Game.new(player_number, dimension, dimension, character_select).start

    #Done with menu prompt, destroy it.
    menu_prompt = nil
  end
end