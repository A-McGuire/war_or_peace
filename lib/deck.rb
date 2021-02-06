class Deck
  attr_reader :cards, :battle_card
  def initialize(cards = [])
    @cards = cards
  end

  def rank_of_card_at(index)
    cards[index].rank
  end

  def high_ranking_cards
    cards.select {|card| card.rank > 10}
  end

  def percent_high_ranking
    percentage = high_ranking_cards.length.to_f / cards.length * 100
    percentage.round(2)
  end

  def remove_card
    cards.shift
  end

  def add_card(card)
    cards << card
  end
end
