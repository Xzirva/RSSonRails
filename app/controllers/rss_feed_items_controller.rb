class RssFeedItemsController < ApplicationController
  before_action :set_rss_feed_item, only: [:mark_read]

  def mark_read
    if @rss_feed_item.update({read: true})
      render json: {:response => 'success'}
    end

  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_rss_feed_item
      @rss_feed_item = RssFeedItem.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def rss_feed_item_params
      params.fetch(:rss_feed_item, {})
    end
end
