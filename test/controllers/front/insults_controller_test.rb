require 'test_helper'

class InsultsControllerTest < ActionDispatch::IntegrationTest
  def test_random
    insult = FactoryBot.create(:insult, :text => "THIS IS THE INSULT")

    get "/front/insults/random"

    assert_response :success
    assert_equal( "application/json", response.content_type )
    assert_equal( "THIS IS THE INSULT", JSON.parse(response.body)["text"] )
  end
end
