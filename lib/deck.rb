class Deck
  attr_reader :cards
  def initialize(cards = [])
    @cards = cards
    # require "pry"; binding.pry
  end

  def rank_of_card_at(index)
    @cards[0].rank
  end

  def high_ranking_cards

  end

  def percent_high_ranking

  end

  def remove_card

  end

  def add_card

  end
end