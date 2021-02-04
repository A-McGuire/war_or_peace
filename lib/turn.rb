class Turn
  attr_reader :player1, :player2, :spoils_of_war
  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @spoils_of_war = []
  end

  def type
    if @player1.deck.rank_of_card_at(0) != @player2.deck.rank_of_card_at(0)
      :basic
    else @player1.deck.cards[0].rank == @player2.deck.cards[0].rank
      :war
    end
  end

  def winner
    if @player1.has_lost? == false
      @player1
    else
      @player2
    end
  end

  def pile_cards
    @spoils_of_war.push()
    @player1.deck.cards.shift
    @player2.deck.cards.shift
  end

  def award_spoils
    winner.deck.cards << @spoils_of_war
    winner.deck.cards.flatten!
  end
end
