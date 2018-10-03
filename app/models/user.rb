class User < ApplicationRecord
  validates_presence_of :uuid
  validates_uniqueness_of :uuid

  before_validation :initialize_attributes, :on => :create

  def to_hash
    {
      :uuid => uuid
    }
  end

  private

  def initialize_attributes
    self.uuid ||= SecureRandom.hex(8)
  end
end
