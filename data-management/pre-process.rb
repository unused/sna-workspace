
require './application'

puts 'Extract Hashtags'
Tweet.where('_tags': nil).each do |tweet|
  tags = tweet.entities['hashtags'].map { |tag| tag.fetch('text').downcase }
  tweet.update! _tags: tags
end

puts 'Extract users'
Tweet.collection.aggregate([
  { '$match': { '_user_extracted': { '$ne': true }}},
  { '$group': { '_id': '$user.id_str', user: { '$first': '$user' }}}
], allow_disk_use: true).each do |user_data|
  user = User.new(user_data['user'])
  user.save!
rescue Mongoid::Error::OperationFailure => err
  puts "[ERR] Could not save user: #{err}"
end
Tweet.update_all _user_extracted: true

require 'whatlanguage'
wl = WhatLanguage.new :all
puts 'Detect tweet language'
Tweet.where('_detected_language': nil).each do |tweet|
  tweet.update! _detected_language: wl.language(tweet.text)
end

puts 'Detect users language'
User.where('_detected_language': nil).each do |user|
  user.update! _detected_language: wl.language(user.description)
end

puts 'Categorize users'
User.where('_categories': nil).each do |user|
  tree = UserTagDecisionTree.new user.description.to_s
  user.update! _categories: Array(tree.tags).sort
end
