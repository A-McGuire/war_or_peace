class Deck
  attr_reader :cards, :battle_card
  def initialize(cards = [])
    @cards = cards
  end

  def rank_of_card_at(index)
    if cards.length == 0
      0
    else cards[index].rank
    end
  end

  def high_ranking_cards
    cards.select {|card| card.rank > 10}
  end

  def percent_high_ranking
    if cards.length > 1
      (high_ranking_cards.length.to_f / cards.length * 100).round(2)
    else
      "There are no cards to be ranked!"
    end
  end

  def remove_card
    cards.shift
  end

  def add_card(card)
    cards << card
  end
end
