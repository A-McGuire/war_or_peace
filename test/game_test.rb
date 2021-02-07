require 'minitest/autorun'
require 'minitest/pride'
# require './lib/war_or_peace_runner'
require './lib/game'

class GameTest < Minitest::Test

  def test_it_exists
    game = Game.new
    assert_instance_of Game, game
  end

  def test_it_has_52_cards
    # skip
    game = Game.new
    game.create_deck
    assert_equal 52, game.main_deck.length
  end

  def test_it_is_random #THIS TEST INTENTIONALLY FAILS
    skip
    game = Game.new
    game.create_deck
    assert_equal game.main_deck, game.randomize
  end

  def test_split_deck
    # skip
    game = Game.new
    # game.create_deck
    game.split_deck
    assert_equal 26, game.deck1.length
    assert_equal game.deck2.length, game.deck1.length
  end

  def test_turn_output
    
  end

end
