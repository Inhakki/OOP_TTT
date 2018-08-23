require_relative 'computer_player'
require_relative 'human_player'
require_relative 'grid'
require_relative 'main_menu'
require_relative 'grid_interface'
require 'tty-prompt'
require 'terminal-table'

class Game
  attr_reader :players, :winner

  def initialize(player_number, grid_width, grid_height, character_select, test_run = false)
    @game_prompt = TTY::Prompt.new
    @test_run = test_run
    @character_select = character_select
    @grid = Grid.new(grid_width, grid_height)
    @current_turn_index = 0
    @players = initialize_players(player_number)
  end

  def start
    game_steps
  end

  private

  def game_steps
    while !@wait_for_move || !@grid.winner? || !@grid.cats_game?
      current_player = @players[@current_turn_index]

      if current_player.class == HumanPlayer
        @wait_for_move = true
      end

      finished_moving = current_player.handle_turn(@grid)

      if finished_moving
        @wait_for_move = false
        toggle_turn
      end

      break if @grid.winner?
    end

    if @grid.winner?
      winners_grid = GridInterface.new(@grid).render_view
      puts winners_grid

      @winner = @grid.get_winner[:winner]

      if  @winner == :x
        puts "X wins"
      else
        puts "O wins"
      end
      ask_to_play_again
    end

    if @grid.cats_game?
      draw_game = GridInterface.new(@grid).render_view
      puts draw_game

      puts "Game was a draw."

      ask_to_play_again
    end
  end

  def ask_to_play_again
    answer = @game_prompt.yes?("Play again?")

    if answer
      MainMenu.new.start
    else
      puts "Thank you for playing! Shutting down..."
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

    if player_number == 1 && !@test_run
      [HumanPlayer.new(@character_select, "Player 1"), ComputerPlayer.new(remainder[0], "Computer")].shuffle
    else
      [HumanPlayer.new(@character_select, "Player 1"), HumanPlayer.new(remainder[0], "Player 2")].shuffle
    end
  end
end