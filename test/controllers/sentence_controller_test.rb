require 'test_helper'

class SentenceControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get create" do
    get :create
    assert_response :success
  end

  test "should get add_comment" do
    get :add_comment
    assert_response :success
  end

end
