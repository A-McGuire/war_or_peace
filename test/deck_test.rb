require 'minitest/autorun'
require 'minitest/pride'
require './lib/deck'

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
end
