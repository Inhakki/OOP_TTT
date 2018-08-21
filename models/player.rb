class Player
  attr_accessor :character, :move, :name, :type

  def initialize(character, name)
    @character = character
    @name = name
  end
end