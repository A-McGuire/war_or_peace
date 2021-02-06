class Turn
  attr_reader :player1, :player2, :spoils_of_war
  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @spoils_of_war = []
  end

  def type #determines type of battle and removes card. see deck>remove_card method
    if player1.deck.rank_of_card_at(0) != player2.deck.rank_of_card_at(0)
      :basic

    elsif player1.deck.rank_of_card_at(0) == player2.deck.rank_of_card_at(0) &&
          player1.deck.rank_of_card_at(2) == player2.deck.rank_of_card_at(2)
      :mutually_assured_destruction

    elsif player1.deck.rank_of_card_at(0) == player2.deck.rank_of_card_at(0)
      :war

    end
  end

  def winner #determines winner of turn
    if player1.deck.rank_of_card_at(0) > player2.deck.rank_of_card_at(0)
      player1
    else
      player2
    end
  end

  def pile_cards
    spoils_of_war.push(player1.deck.remove_card, player2.deck.remove_card)
  end

  def award_spoils
    (winner.deck.cards << pile_cards).flatten!
  end
end
