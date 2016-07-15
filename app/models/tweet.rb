class Tweet < ActiveRecord::Base
  validates :tweetID, uniqueness: true

  # Remember to create a migration!
  def self.base(user)
    tu_id = TwitterUser.find_by(usuario: user).id
    ary_t = CLIENT.user_timeline(user).take(10)
    ary_t.each{|tweet| Tweet.create(twitter_user_id: tu_id, tweetID: tweet.id, tweetTEXT: tweet.text)}
  end
end
