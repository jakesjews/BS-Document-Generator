require 'test_helper'

class BsGeneratorControllerTest < ActionController::TestCase
  test "should get get_pdf" do
    get :get_pdf
    assert_response :success
  end

end
