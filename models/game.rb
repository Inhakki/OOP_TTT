require_relative 'computer_player'
require_relative 'human_player'
require_relative 'grid'
require_relative 'grid_view'
require 'tty-prompt'

class Game
  attr_reader :players

  def initialize(player_number, grid_width, grid_height, character_select, test_run = false)
    @game_prompt = TTY::Prompt.new
    @test_run = test_run
    @players = initialize_players(player_number)
    @grid = Grid.new(grid_width, grid_height)
    @character_select = character_select
  end

  def start
    game_steps
  end

  def current_status?
    @grid.grid
  end

  private

  def game_steps
    byebug

    GridView.new.show_grid_view(@grid)
    # while !@grid.winner? || !@grid.cats_game?
    #   byebug
    #
    # end
    #
    # if @grid.winner?
    #   @game_prompt
    # end
  end

  def initialize_players(player_number)
    remainder = [:x, :o]
    remainder.delete(@character_select)

    if @test_run
      #If we have a test initialize we can better test our computer players against each other.
      return [ComputerPlayer.new(:x, "Computer 1"), ComputerPlayer.new(:o, "Computer 2")].shuffle
    end

    if player_number  == 1 && !@test_run
      [HumanPlayer.new(@character_select, "Player 1"), ComputerPlayer.new(remainder, "Computer")].shuffle
    elsif
      [HumanPlayer.new(@character_select, "Player 1"), HumanPlayer.new(remainder, "Player 2")].shuffle
    end
  end

  # def evaluate_turn
  #   unless @grid.winner?
  #     @turn += 1
  #   end
  # end
end