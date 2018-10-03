require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def test_should_be_valid
    user = FactoryBot.create(:user)
    assert(user.valid?)
  end

  def test_initialize_attributes
    user = FactoryBot.build(:user)
    assert_nil(user.uuid)

    user.save!
    assert_not_nil(user.uuid)
  end

  def test_load_more_insults
    insult_1 = FactoryBot.create(:insult)
    insult_2 = FactoryBot.create(:insult)
    insult_3 = FactoryBot.create(:insult)
    insult_4 = FactoryBot.create(:insult)
    insult_5 = FactoryBot.create(:insult)

    user = FactoryBot.create(:user)

    # Adding 2 insults when the User still has none
    assert_difference "InsultCard.count", 2 do
      user.load_more_insults(2)
    end
    assert_equal(2, user.insults.count)
    assert_equal(insult_2, user.insults.by_order.last)

    # Adding 2 insults
    assert_difference "InsultCard.count", 2 do
      user.load_more_insults(2)
    end
    assert_equal(4, user.insults.count)
    assert_equal(insult_4, user.insults.by_order.last)

    # Adding 3 insults but only one available
    assert_difference "InsultCard.count", 1 do
      user.load_more_insults(3)
    end
    assert_equal(5, user.insults.count)
    assert_equal(insult_5, user.insults.by_order.last)

    # Adding 1 insults but none available
    assert_difference "InsultCard.count", 0 do
      user.load_more_insults(1)
    end
    assert_equal(5, user.insults.count)
    assert_equal(insult_5, user.insults.by_order.last)
  end
end

