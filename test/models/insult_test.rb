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

  def test_initialize_attributes
    insult_pre = FactoryBot.create(:insult, :order => 100)

    insult = FactoryBot.build(:insult)
    assert_nil(insult.uuid)
    assert_nil(insult.order)

    insult.save!
    assert_not_nil(insult.uuid)
    assert_equal(101, insult.order)
  end

  def test_next
    insult_1 = FactoryBot.create(:insult, :order => 100)
    insult_2 = FactoryBot.create(:insult, :order => 101)
    insult_3 = FactoryBot.create(:insult, :order => 110)

    assert_equal(insult_2, insult_1.next)
    assert_equal(insult_3, insult_2.next)

    assert_raise(ActiveRecord::RecordNotFound) do
      insult_3.next
    end
  end

  def test_previouse
    insult_1 = FactoryBot.create(:insult, :order => 100)
    insult_2 = FactoryBot.create(:insult, :order => 101)
    insult_3 = FactoryBot.create(:insult, :order => 110)

    assert_equal(insult_2, insult_3.previous)
    assert_equal(insult_1, insult_2.previous)

    assert_raise(ActiveRecord::RecordNotFound) do
      insult_1.previous
    end
  end
end

