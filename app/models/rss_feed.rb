class RssFeed < ActiveRecord::Base
  include RSS
  validates_presence_of :title
  validates_presence_of :url
  validates_uniqueness_of :url
  has_many :rss_feed_items, dependent: :destroy

  def raw_items
    load_rss(self.url)
  end

  def wrong_raw_items
    test = raw_items
    if test.is_a?(String) # Error
      errors[:base] << "#{test} Erreur de récupération des billets
du flux: Veuillez contacter les propriétaires du flux"
      return true
    end
    false
  end
end
