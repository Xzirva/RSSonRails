class CreateRssFeedItems < ActiveRecord::Migration
  def change
    create_table :rss_feed_items do |t|
      t.string :title, null: false
      t.text :summary, null: false
      t.datetime :date, null: false
      t.boolean :read, null: false
      t.string :url, null: false
      t.references(:rss_feed, null: false)
      t.timestamps null: false
    end
  end
end
