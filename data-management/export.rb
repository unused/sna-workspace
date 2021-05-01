
require './application'
require 'csv'

tweets = Tweet.where :retweeted_status.exists => true, _tags: ENV.fetch('HASHTAGS')

type = ENV.fetch('HASHTAGS').downcase.gsub(/[^a-z]/, '')

print "Export #{tweets.count} entities"
CSV.open "./exports/#{Time.now.utc.to_i}-#{type}.csv", 'w' do |csv|
  tweets.each do |tweet|
    csv << [tweet.user['id'], tweet.retweeted_status['user']['id']]
    print '.'
  end
end
print "\n"
