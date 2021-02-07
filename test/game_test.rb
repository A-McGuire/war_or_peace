require 'minitest/autorun'
require 'minitest/pride'
require './lib/game'
require './lib/player'
require './lib/card'
require './lib/deck'
require './lib/turn'

class GameTest < Minitest::Test

  def test_it_exists
    game = Game.new
    assert_instance_of Game, game
  end

  def test_it_has_52_cards
    # skip
    game = Game.new
    game.create_deck
    assert_equal 52, game.create_deck.length
  end

  def test_split_deck
    # skip
    game = Game.new
    # game.create_deck
    game.split_deck
    assert_equal 26, game.player1_deck.length
    assert_equal game.player2_deck.length, game.player1_deck.length
  end

  def test_there_are_decks
    game = Game.new
    game.split_deck
    deck1 = Deck.new(game.player1_deck)
    deck2 = Deck.new(game.player2_deck)
    assert_equal 26, deck1.cards.length
    assert_equal 26, deck2.cards.length
  end

  def test_there_are_players_with_decks
    game = Game.new
    game.split_deck
    deck1 = Deck.new(game.player1_deck)
    deck2 = Deck.new(game.player2_deck)

    player1 = Player.new("Megan", deck1)
    player2 = Player.new("Aurora", deck2)
    assert_equal player1.deck.cards, deck1.cards
    assert_equal player2.deck.cards, deck2.cards

  end

end
