require 'test_helper'

class InsultsControllerTest < ActionDispatch::IntegrationTest
  def test_create
    post "/front/users"

    user = User.last

    assert_response :success
    assert_equal( "application/json", response.content_type )
    assert_equal( user.uuid, JSON.parse(response.body)["uuid"] )
  end
end
