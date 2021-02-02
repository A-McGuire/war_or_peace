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

  def test_high_ranking_cards
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)
    card4 = Card.new(:spade, 'Jack', 11)
    card5 = Card.new(:clubs, '10', 10)
    cards = [card1, card2, card3, card4, card5]
    deck = Deck.new(cards)
    assert_equal [card1, card3, card4], deck.high_ranking_cards
  end

  def test_percent_high_ranking
    # skip
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)
    cards = [card1, card2, card3]
    deck = Deck.new(cards)
    deck.high_ranking_cards
    assert_equal 66.67, deck.percent_high_ranking
  end

  def test_remove_card
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)
    cards = [card1, card2, card3]
    deck = Deck.new(cards)
    assert_equal card1, deck.remove_card
    assert_equal [card3], deck.high_ranking_cards
    assert_equal 50.00, deck.percent_high_ranking
  end

  def test_add_card
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)
    card4 = Card.new(:heart, 'King', 13)
    cards = [card1, card2, card3]
    deck = Deck.new(cards)
    assert_equal cards, deck.add_card(card4)
    assert_equal [card1, card3, card4], deck.high_ranking_cards
    assert_equal 75.00, deck.percent_high_ranking
  end
end
