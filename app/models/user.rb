class User < ApplicationRecord
  LOAD_MORE_INSULT_CARDS_LIMITS = [2, 10]

  has_many :insult_cards, :dependent => :destroy
  has_many :insults, :through => :insult_cards

  validates_presence_of :uuid
  validates_uniqueness_of :uuid

  before_validation :initialize_attributes, :on => :create

  def to_hash
    {
      :uuid => uuid
    }
  end

  def load_more_insults(amount)
    last_order = insults.maximum(:order) || 0
    insults_to_add = Insult.by_order.where("insults.order > ?", last_order).limit(amount)

    insults_to_add.each do |insult|
      self.insult_cards.create!(:insult => insult)
    end
  end

  private

  def all_insult_cards_readed?
    insult_cards.all?(&:readed?)
  end

  def initialize_attributes
    self.uuid ||= SecureRandom.hex(8)
  end

  def self.random_amount_between_limits
    rand(LOAD_MORE_INSULT_CARDS_LIMITS.first..LOAD_MORE_INSULT_CARDS_LIMITS.last)
  end
end
