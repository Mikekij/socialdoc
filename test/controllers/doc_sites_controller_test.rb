require 'test_helper'

class DocSitesControllerTest < ActionController::TestCase
  setup do
    @doc_site = doc_sites(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:doc_sites)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create doc_site" do
    assert_difference('DocSite.count') do
      post :create, doc_site: { doc_id: @doc_site.doc_id, tracked_site_id: @doc_site.tracked_site_id, url: @doc_site.url }
    end

    assert_redirected_to doc_site_path(assigns(:doc_site))
  end

  test "should show doc_site" do
    get :show, id: @doc_site
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @doc_site
    assert_response :success
  end

  test "should update doc_site" do
    patch :update, id: @doc_site, doc_site: { doc_id: @doc_site.doc_id, tracked_site_id: @doc_site.tracked_site_id, url: @doc_site.url }
    assert_redirected_to doc_site_path(assigns(:doc_site))
  end

  test "should destroy doc_site" do
    assert_difference('DocSite.count', -1) do
      delete :destroy, id: @doc_site
    end

    assert_redirected_to doc_sites_path
  end
end
