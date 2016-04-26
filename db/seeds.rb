require 'rss_helper'
include RSS

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
urls = ["http://www.journaldunet.com/rss/"]
i = 1
urls.each { |url|
  rss = load_rss(url)
  feed = RssFeed.create(title: "RSS Feed #{i}", url: url)
  i = i + 1
  rss.each { |r|
    RssFeedItem.create(title: r.title, url: r.link, summary: r.description, read: false, date: r.date, rss_feed_id: feed.id)
  }
}