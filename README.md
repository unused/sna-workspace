
# SNA Workspace

A social network analysis workspace that provides easy to use data fetch,
processing and visualization tools, scripts and descriptions.


## Project Structure

```
- |
  | - gotwt/ ... a minimalistic tweet crawler written in go
  | - twitter-stream/ ... a minimalistic tweet crawler written in ruby
  | - data-management/ ... a framework to import, transform and export tweets and users
  | - mongodb-charts/ ... a setup for mongodb charts
```

## Twitter Notes

  - `id` ... unique identifier of a message, within a URL
    `https://twitter.com/:screenname:/status/:id:`

  - `text` ... post message

  - `in_reply_to_status_id` ... parent message for replies, also:
    `in_reply_to_user_id`

  - `user` ... user object with: `id`, `name`, `screen_name`

  - `quoted_status_id` ... is a quoted status to..., also `is_quote_status`

  - `favorite_count`, `retweet_count`, (premium: `quote_count`, `reply_count`)

  - `entities` ... contain entities that have been parsed out of the text, like
    `urls`, `hashtags`, etc.

  - `lang` ... language of a tweet (BCP 47)

https://developer.twitter.com/en/docs/twitter-api/v1/data-dictionary/object-model/tweet
