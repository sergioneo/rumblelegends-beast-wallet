require 'test_helper'

class EggsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get eggs_index_url
    assert_response :success
  end

end
