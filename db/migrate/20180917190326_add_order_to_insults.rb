class AddOrderToInsults < ActiveRecord::Migration[5.2]
  def change
    add_column :insults, :order, :integer
    add_index :insults, :order, :unique => true
  end
end
