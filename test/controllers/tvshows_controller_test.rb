require 'test_helper'

class TvshowsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get tvshows_create_url
    assert_response :success
  end

  test "should get destroy" do
    get tvshows_destroy_url
    assert_response :success
  end

end
