class Player
  attr_reader :name, :player_choice

  def initialize(name)
    @name = name.capitalize
  end

  def choice(choice)
    @player_choice = choice
  end
end
