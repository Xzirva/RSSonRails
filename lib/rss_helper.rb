require 'rss'
require 'open-uri'
require 'nokogiri'

module RSS
  def load_rss(url)
    items = []
    Rails.cache.fetch(url, expire_in: 1.minutes) do
      begin
        items = RSS::Parser.parse(open(url).read, false).items
        items
      rescue
        break
      end
    end
    if items.size == 0
      'Désolé, Une erreur est survenue'
    else
      items
    end
  end

end