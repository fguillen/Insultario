require 'test_helper'

class InsultsControllerTest < ActionDispatch::IntegrationTest
  # def test_random
  #   insult = FactoryBot.create(:insult, :text => "THIS IS THE INSULT")

  #   get "/front/insults/random"

  #   assert_response :success
  #   assert_equal( "application/json", response.content_type )
  #   assert_equal( "THIS IS THE INSULT", JSON.parse(response.body)["text"] )
  # end

  def test_show
    user = FactoryBot.create(:user, :uuid => "USER_UUID")
    insult = FactoryBot.create(:insult, :text => "THIS IS THE INSULT", :uuid => "INSULT_UUID")

    insult_card = FactoryBot.create(:insult_card, :user => user, :insult => insult)

    get "/front/users/USER_UUID/insults/INSULT_UUID"

    assert_response :success
    assert_equal( "application/json", response.content_type )
    assert_equal( "THIS IS THE INSULT", JSON.parse(response.body)["insult"]["text"] )
    assert_equal( false, JSON.parse(response.body)["readed"] )
  end

  def test_index
    user = FactoryBot.create(:user, :uuid => "USER_UUID")
    insult_1 = FactoryBot.create(:insult, :text => "INSULT_TEXT")
    insult_2 = FactoryBot.create(:insult)
    insult_3 = FactoryBot.create(:insult)
    insult_card_1 = FactoryBot.create(:insult_card, :user => user, :insult => insult_1)
    insult_card_2 = FactoryBot.create(:insult_card, :user => user, :insult => insult_2)

    get "/front/users/USER_UUID/insults"

    assert_response :success
    assert_equal( "application/json", response.content_type )
    assert_equal( 2, JSON.parse(response.body).count )
    assert_equal( "INSULT_TEXT", JSON.parse(response.body).first["insult"]["text"] )
    assert_equal( false, JSON.parse(response.body).first["readed"] )
  end

  def test_mark_as_readed
    insult_card = FactoryBot.create(:insult_card, :readed_at => nil)
    assert_equal(false, insult_card.readed?)

    put "/front/users/#{insult_card.user.uuid}/insults/#{insult_card.insult.uuid}/mark_as_readed"

    insult_card.reload
    assert_equal(true, insult_card.readed?)
  end

  def test_mark_as_loved
    insult_card = FactoryBot.create(:insult_card, :loved_at => nil)
    assert_equal(false, insult_card.loved?)

    put "/front/users/#{insult_card.user.uuid}/insults/#{insult_card.insult.uuid}/mark_as_loved"

    insult_card.reload
    assert_equal(true, insult_card.loved?)
  end

  def test_mark_as_unloved
    insult_card = FactoryBot.create(:insult_card, :loved_at => Time.now)
    assert_equal(true, insult_card.loved?)

    put "/front/users/#{insult_card.user.uuid}/insults/#{insult_card.insult.uuid}/mark_as_unloved"

    insult_card.reload
    assert_equal(false, insult_card.loved?)
  end

  # def test_next
  #   insult_1 = FactoryBot.create(:insult, :order => 100, :uuid => "UUID_1")
  #   insult_2 = FactoryBot.create(:insult, :order => 101, :uuid => "UUID_2")

  #   get "/front/insults/UUID_1/next"

  #   assert_response :success
  #   assert_equal( "application/json", response.content_type )
  #   assert_equal( "UUID_2", JSON.parse(response.body)["uuid"] )
  # end

  # def test_next_when_not_found
  #   insult = FactoryBot.create(:insult, :order => 100, :uuid => "UUID_1")

  #   get "/front/insults/UUID_1/next"

  #   assert_response :not_found
  #   assert_equal( "application/json", response.content_type )
  # end

  # def test_previous
  #   insult_1 = FactoryBot.create(:insult, :order => 100, :uuid => "UUID_1")
  #   insult_2 = FactoryBot.create(:insult, :order => 101, :uuid => "UUID_2")

  #   get "/front/insults/UUID_2/previous"

  #   assert_response :success
  #   assert_equal( "application/json", response.content_type )
  #   assert_equal( "UUID_1", JSON.parse(response.body)["uuid"] )
  # end

  # def test_previous_when_not_found
  #   insult = FactoryBot.create(:insult, :order => 101, :uuid => "UUID_2")

  #   get "/front/insults/UUID_2/previous"

  #   assert_response :not_found
  #   assert_equal( "application/json", response.content_type )
  # end

end
