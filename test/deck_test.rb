require 'minitest/autorun'
require 'minitest/pride'
require './lib/deck'
require './lib/card'

class DeckTest < Minitest::Test

  def test_it_exists
    cards = []
    deck = Deck.new(cards)
    assert_instance_of Deck, deck
  end

  def test_default_value
    cards = [1,2,3]
    deck = Deck.new()
    assert_equal [], deck.cards
  end

  def test_readable_attribute
    cards = [1,2,3]
    deck = Deck.new(cards)
    assert_equal [1,2,3], deck.cards
  end

  def test_card_deck_interaction
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)
    cards = [card1, card2, card3]
    deck = Deck.new(cards)
    # require "pry"; binding.pry
    assert_equal cards, deck.cards
  end

  def test_rank_of_card_at
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)
    cards = [card1, card2, card3]
    deck = Deck.new(cards)
    assert_equal 12, deck.rank_of_card_at(0)
    assert_equal 3, deck.rank_of_card_at(1)
    assert_equal 14, deck.rank_of_card_at(2)
  end
end
