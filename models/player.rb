class Player

  attr_accessor :character, :move

  def initialize(type, character)
    @type = type
    @character = character
  end

end