class InitializeInsultsOrder < ActiveRecord::Migration[5.2]
  def up
    Insult.by_order.each_with_index do |insult, index|
      insult.update!(:order => index)
    end
  end
end
