class CreateRssFeeds < ActiveRecord::Migration
  def change
    create_table :rss_feeds do |t|
      t.string :title, null: false
      t.boolean :read, null: false
      t.string :summary, null: false
      t.datetime :date, null: false
      t.string :url, null: false
      t.timestamps null: false
    end
  end
end
