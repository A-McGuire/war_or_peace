require './lib/war_or_peace_runner'
require 'minitest/autorun'
require 'minitest/pride'

class RunnerTest < Minitest::Test
  def test_it_exists
    runner = Runner.new
    assert_instance_of Runner, runner
  end

  def test_it_has_52_cards
    runner = Runner.new
    runner.create_deck
    assert_equal 52, runner.main_deck.length
  end

  def test_it_is_random #THIS TEST INTENTIONALLY FAILS
    skip
    runner = Runner.new
    runner.create_deck
    assert_equal runner.main_deck, runner.randomize
  end

  def test_split_deck
    # skip
    runner = Runner.new
    runner.create_deck
    runner.split_deck
    assert_equal 26, runner.deck1.length
    assert_equal runner.deck2.length, runner.deck1.length
  end

  def test_it_has_attributes
  end
  def test_it_can_have_different_attributes
  end
end
