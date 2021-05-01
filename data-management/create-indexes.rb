
require './application'

# ... or remove_indexes
[Tweet, User].each { |model| model.create_indexes }
