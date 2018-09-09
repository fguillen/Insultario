require 'test_helper'

class InsultTest < ActiveSupport::TestCase
  def test_should_be_valid
    insult = FactoryBot.create(:insult)
    assert(insult.valid?)
  end
end
