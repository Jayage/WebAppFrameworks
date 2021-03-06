require 'test_helper'

class SiteControllerTest < ActionController::TestCase
  test "should get about" do
    get :about
    assert_response :success
  end

  test "should get contact" do
    get :contact
    assert_response :success
  end

  test "should get divisions" do
    get :divisions
    assert_response :success
  end

  test "should get media" do
    get :media
    assert_response :success
  end

  test "should get home" do
    get :home
    assert_response :success
  end

end
