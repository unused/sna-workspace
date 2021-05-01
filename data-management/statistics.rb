
require './application'

qry = { _tags: ENV.fetch('HASHTAGS') }

# Tweet.where(qry).group :lang
