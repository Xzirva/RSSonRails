require 'rss_helper'
class RssFeedsController < ApplicationController

  include RSS
  before_action :set_rss_feed, only: [:show, :edit, :update, :destroy]

  # GET /rss_feeds
  # GET /rss_feeds.json
  def index
    @rss_feeds = RssFeed.all.includes(:rss_feed_items)
  end

  # GET /rss_feeds/1
  # GET /rss_feeds/1.json
  def show
  end

  # GET /rss_feeds/new
  def new
    @rss_feed = RssFeed.new
  end

  # GET /rss_feeds/1/edit
  def edit
  end

  # POST /rss_feeds
  # POST /rss_feeds.json
  def create
    @rss_feed = RssFeed.new(rss_feed_params)
    rss_items = load_rss(@rss_feed.url)
    unless rss_items.is_a?(String)
      rss_items.each { |r|
        @rss_feed.rss_feed_items.build(title: r.title, url: r.link, summary: r.description, read: false, date: r.date, rss_feed_id: RssFeed.count + 1)
      }
      respond_to do |format|
        if @rss_feed.save
            rss_items = @rss_feed.rss_feed_items
          format.json { render json: [@rss_feed,rss_items], status: :created}
        else
          format.json { render json: @rss_feed.errors, status: :unprocessable_entity }
        end
      end
    end
  end

  # PATCH/PUT /rss_feeds/1
  # PATCH/PUT /rss_feeds/1.json

  def destroy
    @rss_feed.destroy
    respond_to do |format|
      format.html { redirect_to rss_feeds_url, notice: 'Rss feed was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_rss_feed
    @rss_feed = RssFeed.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def rss_feed_params
    params.permit(:title, :url)
  end
end
