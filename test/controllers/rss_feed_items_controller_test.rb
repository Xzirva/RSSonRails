require 'test_helper'

class RssFeedItemsControllerTest < ActionController::TestCase
  setup do
    @rss_feed_item = rss_feed_items(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:rss_feed_items)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create rss_feed_item" do
    assert_difference('RssFeedItem.count') do
      post :create, rss_feed_item: {  }
    end

    assert_redirected_to rss_feed_item_path(assigns(:rss_feed_item))
  end

  test "should show rss_feed_item" do
    get :show, id: @rss_feed_item
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @rss_feed_item
    assert_response :success
  end

  test "should update rss_feed_item" do
    patch :update, id: @rss_feed_item, rss_feed_item: {  }
    assert_redirected_to rss_feed_item_path(assigns(:rss_feed_item))
  end

  test "should destroy rss_feed_item" do
    assert_difference('RssFeedItem.count', -1) do
      delete :destroy, id: @rss_feed_item
    end

    assert_redirected_to rss_feed_items_path
  end
end
