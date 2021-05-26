# frozen_string_literal: true

require 'twitter'
require 'json'


client = Twitter::REST::Client.new do |config|
  config.consumer_key = ENV.fetch 'CONSUMER_KEY'
  config.consumer_secret = ENV.fetch 'CONSUMER_SECRET'
  config.access_token = ENV.fetch 'ACCESS_TOKEN'
  config.access_token_secret = ENV.fetch 'ACCESS_SECRET'
end

# @see https://github.com/sferik/twitter/blob/master/examples/AllTweets.md

def collect_with_max_id(collection=[], max_id=nil, &block)
  response = yield(max_id)
  collection += response

  if response.empty?
    collection.flatten
  else
    collect_with_max_id(collection, response.last.id - 1, &block)
  end
end

def client.get_all_tweets(user)
  collect_with_max_id do |max_id|
    options = {count: 200, include_rts: true}
    options[:max_id] = max_id unless max_id.nil?
    user_timeline(user, options)
  end
end

tweets = client.get_all_tweets(ENV.fetch('TWITTER_USER'))

File.write 'user-tweets.json', tweets.map { |tweet| tweet.to_h.to_json }.join("\n")

