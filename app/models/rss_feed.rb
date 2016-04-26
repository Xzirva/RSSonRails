class RssFeed < ActiveRecord::Base

  validates_presence_of :title
  validates_presence_of :url
  validates_uniqueness_of :url
  has_many :rss_feed_items, dependent: :destroy
end
