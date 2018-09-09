require 'test_helper'

class InsultTest < ActiveSupport::TestCase
  def test_should_be_valid
    insult = FactoryBot.create(:insult)
    assert(insult.valid?)
  end

  def test_random
    insult_1 = FactoryBot.create(:insult, :id => 1001)
    insult_2 = FactoryBot.create(:insult, :id => 1002)

    result = 100.times.map { |i| Insult.random }.uniq.sort

    assert_equal([insult_1, insult_2], result)
  end
end

