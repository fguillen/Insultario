class Insult < ApplicationRecord
  validates_presence_of :text
  validates_uniqueness_of :text
  validates_presence_of :uuid
  validates_uniqueness_of :uuid
  validates_presence_of :order
  validates_uniqueness_of :order

  before_validation :initialize_attributes, :on => :create

  scope :by_order, -> { order(:order => :asc) }

  def self.random
    Insult.find(Insult.pluck(:id).sample)
  end

  def to_hash
    {
      :uuid => uuid,
      :text => text
    }
  end

  def next
    Insult.where("`order` > ?", self.order).by_order.first!
  end

  def previous
    Insult.where("`order` < ?", self.order).by_order.last!
  end

  private

  def initialize_attributes
    self.uuid ||= SecureRandom.hex(8)
    self.order ||= Insult.any? ? Insult.maximum(:order) + 1 : 1
  end
end
