require 'rss'
require 'open-uri'
require 'nokogiri'

module RSS
  def load_rss(url)
    items = Rails.cache.fetch(url, expire_in: 1.minutes) do
      begin
        RSS::Parser.parse(open(url).read, false).items
      rescue
        break
      end
    end
    if items.nil?
      'Désolé, Une erreur est survenue'
    else
      items
    end
  end

end