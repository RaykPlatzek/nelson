require 'test_helper'

class PairsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get pairs_new_url
    assert_response :success
  end

  test "should get create" do
    get pairs_create_url
    assert_response :success
  end

end
