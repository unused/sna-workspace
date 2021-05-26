
require './application'
require 'csv'

# Iterate all tweets, take the combination of hashtags and store them in a
# CSV file. The data represents a co-occurence network where hashtags are
# nodes and their co-occurence forms an edge. The network is undirected.


CSV.open("./exports/#{Time.now.utc.to_i}-hashtags-co-occurence-network.csv", 'wb') do |csv|
  Tweet.each do |tweet|
    next if Array(tweet._tags).count == 0

    if tweet._tags.count == 1
      csv << [tweet._tags.first, tweet._tags.first]
    else
      tweet._tags.combination(2).each do |edge|
        csv << edge
      end
    end
  end
end
