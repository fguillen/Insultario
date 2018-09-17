require 'test_helper'

class InsultsControllerTest < ActionDispatch::IntegrationTest
  def test_random
    insult = FactoryBot.create(:insult, :text => "THIS IS THE INSULT")

    get "/front/insults/random"

    assert_response :success
    assert_equal( "application/json", response.content_type )
    assert_equal( "THIS IS THE INSULT", JSON.parse(response.body)["text"] )
  end

  def test_show
    insult = FactoryBot.create(:insult, :text => "THIS IS THE INSULT", :uuid => "UUID")

    get "/front/insults/UUID"

    assert_response :success
    assert_equal( "application/json", response.content_type )
    assert_equal( "THIS IS THE INSULT", JSON.parse(response.body)["text"] )
  end

  def test_next
    insult_1 = FactoryBot.create(:insult, :order => 100, :uuid => "UUID_1")
    insult_2 = FactoryBot.create(:insult, :order => 101, :uuid => "UUID_2")

    get "/front/insults/UUID_1/next"

    assert_response :success
    assert_equal( "application/json", response.content_type )
    assert_equal( "UUID_2", JSON.parse(response.body)["uuid"] )
  end

  def test_next_when_not_found
    insult = FactoryBot.create(:insult, :order => 100, :uuid => "UUID_1")

    get "/front/insults/UUID_1/next"

    assert_response :not_found
    assert_equal( "application/json", response.content_type )
  end

  def test_previous
    insult_1 = FactoryBot.create(:insult, :order => 100, :uuid => "UUID_1")
    insult_2 = FactoryBot.create(:insult, :order => 101, :uuid => "UUID_2")

    get "/front/insults/UUID_2/previous"

    assert_response :success
    assert_equal( "application/json", response.content_type )
    assert_equal( "UUID_1", JSON.parse(response.body)["uuid"] )
  end

  def test_previous_when_not_found
    insult = FactoryBot.create(:insult, :order => 101, :uuid => "UUID_2")

    get "/front/insults/UUID_2/previous"

    assert_response :not_found
    assert_equal( "application/json", response.content_type )
  end

end
