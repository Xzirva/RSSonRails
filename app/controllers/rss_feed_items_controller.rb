class RssFeedItemsController < ApplicationController
  before_action :set_rss_feed_item, only: [:show, :edit, :update, :destroy]

  # GET /rss_feed_items
  # GET /rss_feed_items.json
  def index
    @rss_feed_items = RssFeedItem.all
  end

  # GET /rss_feed_items/1
  # GET /rss_feed_items/1.json
  def show
  end

  # GET /rss_feed_items/new
  def new
    @rss_feed_item = RssFeedItem.new
  end

  # GET /rss_feed_items/1/edit
  def edit
  end

  # POST /rss_feed_items
  # POST /rss_feed_items.json
  def create
    @rss_feed_item = RssFeedItem.new(rss_feed_item_params)

    respond_to do |format|
      if @rss_feed_item.save
        format.html { redirect_to @rss_feed_item, notice: 'Rss feed item was successfully created.' }
        format.json { render :show, status: :created, location: @rss_feed_item }
      else
        format.html { render :new }
        format.json { render json: @rss_feed_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /rss_feed_items/1
  # PATCH/PUT /rss_feed_items/1.json
  def update
    respond_to do |format|
      if @rss_feed_item.update(rss_feed_item_params)
        format.html { redirect_to @rss_feed_item, notice: 'Rss feed item was successfully updated.' }
        format.json { render :show, status: :ok, location: @rss_feed_item }
      else
        format.html { render :edit }
        format.json { render json: @rss_feed_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /rss_feed_items/1
  # DELETE /rss_feed_items/1.json
  def destroy
    @rss_feed_item.destroy
    respond_to do |format|
      format.html { redirect_to rss_feed_items_url, notice: 'Rss feed item was successfully destroyed.' }
      format.json { head :no_content }
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
