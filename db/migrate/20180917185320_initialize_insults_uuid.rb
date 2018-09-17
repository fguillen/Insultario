class InitializeInsultsUuid < ActiveRecord::Migration[5.2]
  def up
    Insult.where(:uuid => nil).each do |insult|
      insult.update!(:uuid => SecureRandom.hex(8))
    end

    change_column :insults, :uuid, :string, :null => false
  end
end
