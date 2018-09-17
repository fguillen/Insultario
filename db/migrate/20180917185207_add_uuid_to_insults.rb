class AddUuidToInsults < ActiveRecord::Migration[5.2]
  def change
    add_column :insults, :uuid, :string
    add_index :insults, :uuid, :unique => true
  end
end
