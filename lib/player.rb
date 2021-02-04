class Player
  attr_reader :name, :deck
  def initialize(name, deck)
    @name = name
    @deck = deck
    @battle_field = []
  end

  def has_lost?
    # require "pry"; binding.pry
    if deck.battle_field.length < 2
      # require "pry"; binding.pry
      false
    elsif deck.battle_field[0].rank > deck.battle_field[1].rank
      deck.battle_field.pop
      false
    else
      deck.battle_field.shift
      true
    end
  end
end
