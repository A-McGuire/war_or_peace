class Deck
  attr_reader :cards
  def initialize(cards = [])
    @cards = cards
    @high_cards = 0
  end

  def rank_of_card_at(index)
    @cards[index].rank
  end

  def high_ranking_cards
    @high_cards = @cards.select {|card| card.rank > 10}
  end

  def percent_high_ranking
    percentage = @high_cards.length.to_f / cards.length * 100
    percentage.round(2)
  end

  def remove_card

  end

  def add_card

  end
end
