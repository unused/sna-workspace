
class User
  include Mongoid::Document
  include Mongoid::Attributes::Dynamic

  field :_detected_language, type: String
  field :_categories, type: Array

  def self.random
    instantiate collection.aggregate([{ '$sample': { size: 1 } }]).first
  end
end
