class Player
  attr_reader :name, :position, :retired

  def initialize(name, position, retired)
    @name = name
    @position = position
    @retired = false
  end

  def retired?
    @retired
  end

  def mark_as_retired!
    @retired = true
  end
end
