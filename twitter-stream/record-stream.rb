# frozen_string_literal: true

require 'twitter'
require 'json'

class StreamRunner
  attr_accessor :cnt, :client

  def initialize(client)
    self.cnt = 0
    self.client = client
  end

  def run(keywords, file)
    client.filter(track: keywords) do |object|
      tick
      skip unless object.is_a? Twitter::Tweet

      json_tweet = object.to_h.to_json
      # TODO: add _received_at to calculate the age of a tweet
      file << "#{json_tweet}\n"
    end
  rescue Twitter::Error => err
    puts "[ERR] #{err}"
    sleep (err.rate_limit.reset_in || 60) + 1
    retry
  rescue Errno::ECONNRESET => err
    puts "[ERR] #{err}"
    sleep 20
    retry
  end

  def tick
    self.cnt += 1
    print '.' if (cnt % 100) == 0
  end
end

client = Twitter::Streaming::Client.new do |config|
  config.consumer_key = ENV.fetch 'CONSUMER_KEY'
  config.consumer_secret = ENV.fetch 'CONSUMER_SECRET'
  config.access_token = ENV.fetch 'ACCESS_TOKEN'
  config.access_token_secret = ENV.fetch 'ACCESS_SECRET'
end

filename = "rec-#{Time.now.utc.to_i}.jsonl"

# A comma separated list of hashtags to track.
keywords = ENV.fetch 'KEYWORDS'

RUN_TIME = 60 * 1

puts 'Start fetching tweets...'
file = File.open filename, 'a'
file << "KEYWORDS: #{keywords}"
begin
  status = Timeout::timeout(RUN_TIME) do
    StreamRunner.new(client).run keywords, file
  end
rescue Timeout::Error
  puts ' Stop fetching tweets'
end
file.close
