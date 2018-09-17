class Insult < ApplicationRecord
  validates_presence_of :text
  validates_uniqueness_of :text
  validates_presence_of :uuid
  validates_uniqueness_of :uuid

  before_validation :initialize_attributes

  def self.random
    Insult.find(Insult.pluck(:id).sample)
  end

  def to_hash
    {
      :id => id,
      :text => text
    }
  end

  private

  def initialize_attributes
    self.uuid ||= SecureRandom.hex(8)
  end
end
