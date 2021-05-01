
# Load dependencies
require 'twitter'
require 'mongoid'

# Load config
@twitter = Twitter::REST::Client.new do |config|
  config.consumer_key        = ENV['CONSUMER_KEY']
  config.consumer_secret     = ENV['CONSUMER_SECRET']
  config.access_token        = ENV['ACCESS_TOKEN']
  config.access_token_secret = ENV['ACCESS_TOKEN_SECRET']
end

Mongoid.load!('./mongoid.yml', :development)

# Load models, utils
require './models/user.rb'
require './models/tweet.rb'
require './helpers/user_tag_decision_tree.rb'
# require './utils/cli_progress.rb'
