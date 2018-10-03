class InsultCard < ApplicationRecord
  belongs_to :user
  belongs_to :insult

  validates_presence_of :user
  validates_presence_of :insult
  validates_uniqueness_of :user, :scope => :insult

  def to_hash
    {
      :user => user.to_hash,
      :insult => insult.to_hash,
      :readed => readed?,
      :loved => loved?,
    }
  end

  def loved?
    !loved_at.nil?
  end

  def readed?
    !readed_at.nil?
  end

  def readed!
    update!(:readed_at => Time.zone.now)
  end

  def loved!
    update!(:loved_at => Time.zone.now)
  end

  def unloved!
    update!(:loved_at => nil)
  end
end
