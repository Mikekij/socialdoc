require 'test_helper'

class TrackedSitesControllerTest < ActionController::TestCase
  setup do
    @tracked_site = tracked_sites(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:tracked_sites)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create tracked_site" do
    assert_difference('TrackedSite.count') do
      post :create, tracked_site: { name: @tracked_site.name, url: @tracked_site.url }
    end

    assert_redirected_to tracked_site_path(assigns(:tracked_site))
  end

  test "should show tracked_site" do
    get :show, id: @tracked_site
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @tracked_site
    assert_response :success
  end

  test "should update tracked_site" do
    patch :update, id: @tracked_site, tracked_site: { name: @tracked_site.name, url: @tracked_site.url }
    assert_redirected_to tracked_site_path(assigns(:tracked_site))
  end

  test "should destroy tracked_site" do
    assert_difference('TrackedSite.count', -1) do
      delete :destroy, id: @tracked_site
    end

    assert_redirected_to tracked_sites_path
  end
end
