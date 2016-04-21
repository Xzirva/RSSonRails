json.array!(@rss_feed_items) do |rss_feed_item|
  json.extract! rss_feed_item, :id
  json.url rss_feed_item_url(rss_feed_item, format: :json)
end
