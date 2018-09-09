require "test_helper"

class InsultsControllerTest < ActionDispatch::IntegrationTest
  def test_create
    post(
      "/admin/insults",
      :params => {
        :insult => {
          :text => "THIS IS THE INSULT"
        }
      }
    )

    assert_response :success
    assert_equal( "application/json", response.content_type )
    assert_equal( "THIS IS THE INSULT", JSON.parse(response.body)["text"] )

    insult = Insult.last
    assert_equal("THIS IS THE INSULT", insult.text)
  end

  def test_create_not_valid
    post(
      "/admin/insults",
      :params => {
        :insult => {
          :text => ""
        }
      }
    )

    assert_response :error
    assert_equal( "application/json", response.content_type )
    assert_equal( ["Text can't be blank"], JSON.parse(response.body)["errors"] )
  end
end
