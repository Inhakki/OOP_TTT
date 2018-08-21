require_relative 'spec_helper'
require_relative '../models/game'

RSpec.describe 'game' do

  describe 'Game manages players and turns by rules' do
    let(:game) { Game.new(1, 3, 3, :x, true) }

    it 'should instantiate given players per game' do
      expect(game.players.length).to eq(2)
      expect(game.players[0].class).to eq(ComputerPlayer)
      expect(game.players[1].class).to eq(ComputerPlayer)
    end
  end

  describe 'Game ends should be managed by the game.' do
    it 'should manage the status of the game' do

    end
  end
end