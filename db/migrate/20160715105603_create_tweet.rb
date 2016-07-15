class CreateTweet < ActiveRecord::Migration
  def change
    create_table :tweets do |t|
      t.belongs_to :twitter_user #establece una coneccion con la tabla de usuarios
      t.string :tweetID, :unique => true
      t.string :tweetTEXT
      t.timestamp
    end
  end
end
