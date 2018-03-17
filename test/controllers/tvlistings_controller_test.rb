require 'test_helper'

class TvlistingsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get tvlistings_index_url
    assert_response :success
  end

  test "should get show" do
    get tvlistings_show_url
    assert_response :success
  end

  test "should get new" do
    get tvlistings_new_url
    assert_response :success
  end

  test "should get create" do
    get tvlistings_create_url
    assert_response :success
  end

end
