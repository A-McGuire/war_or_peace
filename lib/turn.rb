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


  def war_or_peace
    if player1.has_lost? == true
      return "Player 1 has lost the war"
    elsif player2.has_lost? == true
      return "Player 2 has lost the war"
    elsif type == :basic
      award_spoils
    elsif type == :mutually_assured_destruction
      pile_cards
    elsif type == :war
      award_spoils
    end
  end

  def winner #determines winner of turn
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
    #remove cards from both players decks and add to array spoils_of_war
    #or removes the cards in the case of mutually_assured_destruction
    if type == :basic
      spoils_of_war.push(player1.deck.remove_card, player2.deck.remove_card)
    elsif type == :war
      spoils_of_war.push(player1.deck.remove_card, player1.deck.remove_card,
                        player1.deck.remove_card, player2.deck.remove_card,
                        player2.deck.remove_card, player2.deck.remove_card)
    elsif type == :mutually_assured_destruction
      3.times {player1.deck.remove_card}
      3.times {player2.deck.remove_card}
    end
  end

  def award_spoils
  #   def award_spoils(winner)
  #   @spoils_of_war.each do |card|
  #     winner.deck.add_card(card)
  #   end
  #   #@spoils_of_war.clear
  #   end
    if type == :basic
      round_winner = winner.deck.cards
      pile_cards
      (round_winner).push(spoils_of_war.shift, spoils_of_war.shift)
    elsif type == :war
      round_winner = winner.deck.cards
      pile_cards
      (round_winner).push(spoils_of_war.shift, spoils_of_war.shift,
                          spoils_of_war.shift, spoils_of_war.shift,
                          spoils_of_war.shift, spoils_of_war.shift)
    end
  end
  # Helper methods
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
end
