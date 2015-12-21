require 'test_helper'

class SiteStatsControllerTest < ActionController::TestCase
  setup do
    @site_stat = site_stats(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:site_stats)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create site_stat" do
    assert_difference('SiteStat.count') do
      post :create, site_stat: { address_1: @site_stat.address_1, address_2: @site_stat.address_2, avg_rating: @site_stat.avg_rating, city: @site_stat.city, doc_site_id: @site_stat.doc_site_id, first_page: @site_stat.first_page, five_star_count: @site_stat.five_star_count, hours: @site_stat.hours, one_star_count: @site_stat.one_star_count, phone: @site_stat.phone, review_count: @site_stat.review_count, search_rank: @site_stat.search_rank, state: @site_stat.state, url: @site_stat.url, zip: @site_stat.zip }
    end

    assert_redirected_to site_stat_path(assigns(:site_stat))
  end

  test "should show site_stat" do
    get :show, id: @site_stat
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @site_stat
    assert_response :success
  end

  test "should update site_stat" do
    patch :update, id: @site_stat, site_stat: { address_1: @site_stat.address_1, address_2: @site_stat.address_2, avg_rating: @site_stat.avg_rating, city: @site_stat.city, doc_site_id: @site_stat.doc_site_id, first_page: @site_stat.first_page, five_star_count: @site_stat.five_star_count, hours: @site_stat.hours, one_star_count: @site_stat.one_star_count, phone: @site_stat.phone, review_count: @site_stat.review_count, search_rank: @site_stat.search_rank, state: @site_stat.state, url: @site_stat.url, zip: @site_stat.zip }
    assert_redirected_to site_stat_path(assigns(:site_stat))
  end

  test "should destroy site_stat" do
    assert_difference('SiteStat.count', -1) do
      delete :destroy, id: @site_stat
    end

    assert_redirected_to site_stats_path
  end
end
