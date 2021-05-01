
# User Tag Decision Tree calculates tags by user descriptions.
#
#    | - [gamer|player, gamer]
# -- |
#    | - player
#
class UserTagDecisionTree

  def initialize(text)
    @text = text.downcase
  end

  TREE = [
    [/twitch|streamer/, %w(gamer streamer)],
    [/game developer|game ?dev/, 'gamedev', [[/indie|independent/, 'indie']]],
    [/gamer|player|play games|fav games|love games|gaming/, 'gamer']
  ].freeze

  def tags
    @tags ||= traverse(TREE).compact
  end

  private

  def traverse(rules)
    return unless rules

    _rule, tag, step = rules.find { |rule, tag, _step| @text.match rule }
    [tag, traverse(step)].flatten
  end

  def matches?(rule)
    @text.match rule
  end
end
