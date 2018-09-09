class Insult < ApplicationRecord
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
