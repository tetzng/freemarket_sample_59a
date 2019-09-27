require 'test_helper'

class SellControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get sell_index_url
    assert_response :success
  end

end
