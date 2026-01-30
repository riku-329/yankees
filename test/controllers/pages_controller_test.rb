require "test_helper"

class PagesControllerTest < ActionDispatch::IntegrationTest
  test "should get home" do
    get pages_home_url
    assert_response :success
  end

  test "should get members" do
    get pages_members_url
    assert_response :success
  end

  test "should get results" do
    get pages_results_url
    assert_response :success
  end

  test "should get images" do
    get pages_images_url
    assert_response :success
  end

  test "should get videos" do
    get pages_videos_url
    assert_response :success
  end
end
