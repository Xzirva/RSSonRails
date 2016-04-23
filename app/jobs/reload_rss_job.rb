require 'rss_helper'
class ReloadRssJob
  include SuckerPunch::Job

  include RSS
  def perform

    # Do something later
    rss_feeds = RssFeed.all.includes(:rss_feed_items)
    rss_feeds.each { |rss|
      c_rss = rss
      items = load_rss(rss.url)
      unless items[0].is_a?(String) # == error!
        if items[0].date > rss.rss_feed_items.order(date: :desc).first.date
          items.each { |i|
            c_rss.rss_feed_items.build(title: i.title, url: i.link, summary: i.description, read: false, date: i.date, rss_feed_id: c_rss.id)
          }
          c_rss.save
        #else
          #puts 'Nothing to do'
        end
      end
    }
    ReloadRssJob.perform_in(10)
  end
end
