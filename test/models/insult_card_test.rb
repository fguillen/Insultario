require 'test_helper'

class InsultCardTest < ActiveSupport::TestCase
  def test_should_be_valid
    insult_card = FactoryBot.create(:insult_card)
    assert(insult_card.valid?)
  end

  def test_to_hash
    user = FactoryBot.create(:user, :uuid => "USER_UUID")
    insult = FactoryBot.create(:insult, :uuid => "INSULT_UUID", :text => "TEXT")
    insult_card = FactoryBot.create(:insult_card, :user => user, :insult => insult, :readed_at => Time.now, :loved_at => nil)

    expected_result = {
      :user => {
        :uuid => "USER_UUID"
      },
      :insult => {
        :uuid => "INSULT_UUID",
        :text => "TEXT"
      },
      :readed => true,
      :loved => false
    }

    assert_equal(expected_result, insult_card.to_hash)
  end
end

