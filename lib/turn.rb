class Turn
  attr_reader :player1, :player2, :spoils_of_war
  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @spoils_of_war = []
  end

  def type #determines type of battle
    if first_cards_are_not_the_same
      :basic
    elsif first_cards_and_third_cards_are_the_same
      :mutually_assured_destruction
    elsif first_cards_are_the_same
      :war
    end
  end

  def first_cards_are_not_the_same
    player1.deck.rank_of_card_at(0) != player2.deck.rank_of_card_at(0)
  end

  def first_cards_and_third_cards_are_the_same
    player1.deck.rank_of_card_at(0) == player2.deck.rank_of_card_at(0) &&
    player1.deck.rank_of_card_at(2) == player2.deck.rank_of_card_at(2)
  end

  def first_cards_are_the_same
    player1.deck.rank_of_card_at(0) == player2.deck.rank_of_card_at(0)
  end

  def war_or_peace
    if type == :basic
      # winner
      award_spoils
    end
  end

  def winner #determines winner of turn
    # if player1.deck.rank_of_card_at(0) > player2.deck.rank_of_card_at(0)
    #   player1
    # else
    #   player2
    # end
    if type == :basic
      return player1 if player1.deck.rank_of_card_at(0) > player2.deck.rank_of_card_at(0)
      player2
    elsif type == :war
      return player1 if player1.deck.rank_of_card_at(2) > player2.deck.rank_of_card_at(2)
      player2
    elsif type == :mutually_assured_destruction
      "No winner"
    end
  end

  def pile_cards
    spoils_of_war.push(player1.deck.remove_card, player2.deck.remove_card)
  end

  def award_spoils
    (winner.deck.cards << pile_cards).flatten!
  end
end
