class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :username
      t.string :avatar_url
      t.string :profile_avatar_url
      t.string :micro_avatar_url
      t.string :first_day_of_week
      t.string :biography
      t.string :locale
      t.string :time_zone
      t.integer :default_digest
      t.string :rss_token
      t.string :chat_token
      t.string :token
      t.string :refresh_token

      t.timestamps
    end
  end
end
