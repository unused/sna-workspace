require './application'

def create_tweet_from(json_line)
  unless json_line[0] == '{'
    json_line = json_line.split('{').last
    create_tweet_from json_line if json_line[0] == '{' # second chance

    return
  end

  tweet = JSON.parse json_line
  print (Tweet.new(tweet.to_h).save ? '.' : 'x')
rescue Mongo::Error::OperationFailure => err
  puts "[ERR] Failed to save tweet: #{err}"
rescue JSON::ParserError => err
  puts "[ERR] Failed to parse line... #{String(err).slice(0, 50)}"
end

def import_file(file)
  print "\n[INFO] Import file #{file}..."
  File.readlines(file).each { |line| create_tweet_from line }
  # File.open(file).each_line { |line| create_tweet_from line }
end

import_file ARGV[-1]
