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
end

