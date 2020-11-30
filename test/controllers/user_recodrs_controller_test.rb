require 'test_helper'

class UserRecodrsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get user_recodrs_index_url
    assert_response :success
  end

end
