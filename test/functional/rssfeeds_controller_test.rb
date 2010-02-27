require 'test_helper'

class RssfeedsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:rssfeeds)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create rssfeed" do
    assert_difference('Rssfeed.count') do
      post :create, :rssfeed => { }
    end

    assert_redirected_to rssfeed_path(assigns(:rssfeed))
  end

  test "should show rssfeed" do
    get :show, :id => rssfeeds(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => rssfeeds(:one).to_param
    assert_response :success
  end

  test "should update rssfeed" do
    put :update, :id => rssfeeds(:one).to_param, :rssfeed => { }
    assert_redirected_to rssfeed_path(assigns(:rssfeed))
  end

  test "should destroy rssfeed" do
    assert_difference('Rssfeed.count', -1) do
      delete :destroy, :id => rssfeeds(:one).to_param
    end

    assert_redirected_to rssfeeds_path
  end
end
