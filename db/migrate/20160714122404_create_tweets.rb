class CreateTweets < ActiveRecord::Migration
  def change
    create_table :urls do |t|
      t.belongs_to :twitter_users #establece una coneccion con la tabla de usuarios
      t.string :tweet
      t.timestamp
    end
  end
end
