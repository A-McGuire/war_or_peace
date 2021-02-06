class Turn
  attr_reader :player1, :player2, :spoils_of_war
  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @spoils_of_war = []
  end

  def type #determines type of battle and removes card. see deck>remove_card method
    if @player1.deck.rank_of_card_at(0) != @player2.deck.rank_of_card_at(0)
      # @player1.deck.remove_card; @player1.deck.remove_card
      :basic
    elsif @player1.deck.rank_of_card_at(0) == @player2.deck.rank_of_card_at(0)
      # @player1.deck.remove_card; @player1.deck.remove_card
      :war
    end
  end

  def winner #determines winner of turn
    # require "pry"; binding.pry
    if @player1.deck.rank_of_card_at(0) > @player2.deck.rank_of_card_at(0)
      @player1
    else
      @player2
    end
  end

  def pile_cards
    @spoils_of_war.push(@player1.deck.remove_card, @player2.deck.remove_card)
  end

  def award_spoils
    winner.deck.cards << @spoils_of_war
    winner.deck.cards.flatten!
  end
end
