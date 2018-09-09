class Insult < ApplicationRecord
  validates_presence_of :text
  validates_uniqueness_of :text

  def self.random
    Insult.find(Insult.pluck(:id).sample)
  end

  def to_hash
    {
      :id => id,
      :text => text
    }
  end
end
