class Player
  attr_reader :name, :deck
  def initialize(name, deck)
    @name = name
    @deck = deck
    @battle_field = []
  end

  def has_lost?
    if deck.battle_field.length < 2
      false
    elsif deck.battle_field[0].rank > deck.battle_field[1].rank
      false
    else
      true
    end
  end
end
