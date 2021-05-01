
class Tweet
  include Mongoid::Document
  include Mongoid::Attributes::Dynamic

  field :_tags, type: Array
  field :_user_extracted, type: Boolean, default: false
  field :_detected_language, type: String

  index({ retweet_count: 1 }, background: true)
  index({ favourite_count: 1 }, background: true)
  index({ _tags: 1 }, background: true)
  index({ _user_extracted: 1 }, background: true)
  index({ _detected_language: 1 }, background: true)

  def self.random
    instantiate collection.aggregate([{ '$sample': { size: 1 } }]).first
  end
end
