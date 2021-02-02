class Deck
  attr_reader :cards
  def initialize(cards = [])
    @cards = cards
    # require "pry"; binding.pry
  end
end
