
require 'minitest/autorun'
require_relative '../application'

class TestUserTagDecisionTree < MiniTest::Unit::TestCase

  TEST_CASES = [
    ['Professional Paladins Player', %w[gamer]],
    ['Find me over on Twitch!', %w[gamer streamer]],
    ['A gamer', %w[gamer]],
    ['fav games', %w[gamer]],
    ['I play games', %w[gamer]],
    ['Twitch partner', %w[gamer streamer]],
    ['Indie game developers', %w[indie gamedev]],
    ['gamedev', %w[gamedev]],
    ['game dev', %w[gamedev]],
    ['game developer', %w[gamedev]],
    ['Twitch: @foobar', %w[gamer streamer]],
    ['streamer', %w[gamer streamer]],
    ['A Twitch Affiliate who Streams', %w[gamer streamer]],
    ['love games', %w[gamer]],
    ['A podcast about gaming', %w[gamer]],
    ['Video Gamer', %w[gamer]],
  ]

  def test_tags
    TEST_CASES.each do |input, result|
      puts input
      tree = UserTagDecisionTree.new input
      assert_equal result.sort, Array(tree.tags).sort
    end
  end
end
