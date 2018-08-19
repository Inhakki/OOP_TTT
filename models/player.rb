class Player

  def initialize(type)
    @type = type

  end

  def human?
    @type == :human
  end

  def computer?
    @type == :computer
  end


end