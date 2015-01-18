require 'test_helper'

class HomeControllerTest < ActionController::TestCase
  test "should get objects" do
    get :objects
    assert_response :success
  end

  test "should get coop" do
    get :coop
    assert_response :success
  end

  test "should get contacts" do
    get :contacts
    assert_response :success
  end

end
