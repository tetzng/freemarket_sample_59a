require 'test_helper'

class SignupControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get signup_index_url
    assert_response :success
  end

end
