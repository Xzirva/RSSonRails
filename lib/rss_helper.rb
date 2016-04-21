require 'rss'
require 'open-uri'
require 'nokogiri'

module RSS
  def load_rss(url)
    Rails.cache.fetch(url, expire_in: 1.minutes) do
      RSS::Parser.parse(open(url).read, false).items
    end
  end

end