class Player
  attr_reader :name, :deck
  def initialize(name, deck)
    @name = name
    @deck = deck
  end
  #todo refactor for war and MAS type cases
  def has_lost? #determines loser of game
    deck.cards.length == 0
  end
end
