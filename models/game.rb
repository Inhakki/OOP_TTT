require_relative 'computer_player'
require_relative 'human_player'
require_relative 'grid'
require_relative 'main_menu'
# require_relative 'grid_view'
require 'tty-prompt'
require 'terminal-table'

class Game
  attr_reader :players

  def initialize(player_number, grid_width, grid_height, character_select, test_run = false)
    @game_prompt = TTY::Prompt.new
    @test_run = test_run
    @players = initialize_players(player_number)
    @grid = Grid.new(grid_width, grid_height)
    @character_select = character_select
    @current_turn_index = 0

  end

  def start
    game_steps
  end

  private

  def game_steps
    #
    # GridView.new(@grid).show_grid_view
    while !@grid.winner? || !@grid.cats_game?
      @players[@current_turn_index].handle_turn(@grid)
      break if @grid.winner?
      toggle_turn
    end

    if @grid.winner?
      winners_grid = Terminal::Table.new rows: @grid.grid

      puts winners_grid
      if @grid.get_winner[:winner] == :x
        puts "X wins"

      else
        puts "O wins"
      end
      answer = @game_prompt.yes?("Play again?")

      if answer
        MainMenu.new.start
      else
        puts "Thank you for playing! Shutting down..."
      end
    end
  end

  def toggle_turn
    if @current_turn_index == 0
      @current_turn_index = 1
    else
      @current_turn_index = 0
    end
  end

  def initialize_players(player_number)
    remainder = [:x, :o]
    remainder.delete(@character_select)

    if @test_run
      #If we have a test initialize we can better test our computer players against each other.
      return [ComputerPlayer.new(:x, "Computer 1"), ComputerPlayer.new(:o, "Computer 2")].shuffle
    end

    if player_number  == 1 && !@test_run
      [HumanPlayer.new(@character_select, "Player 1"), ComputerPlayer.new(remainder[0], "Computer")].shuffle
    elsif
      [HumanPlayer.new(@character_select, "Player 1"), HumanPlayer.new(remainder[0], "Player 2")].shuffle
    end
  end

  # def evaluate_turn
  #   unless @grid.winner?
  #     @turn += 1
  #   end
  # end
end