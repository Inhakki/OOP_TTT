RSpec.describe 'player' do

  describe "Player should have accessible player attributes" do
    let (:player) { Player.new(:o, "Player Test") }

    it "should set and show the proper character for player" do
      character = :x
      player.character = character

      expect(player.character).to eq(character)
    end

  end

end