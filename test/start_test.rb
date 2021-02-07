require './lib/war_or_peace_runner'
require 'minitest/autorun'
require 'minitest/pride'

class RunnerTest < Minitest::Test

  def test_it_exists
    start = Start.new
    assert_instance_of Start, start
  end

  def test_start
    tart = Start.new
    assert_equal start.start, "It works!"
  end

end
