class CreateInsults < ActiveRecord::Migration[5.2]
  def change
    create_table :insults do |t|
      t.string :text

      t.timestamps
    end
  end
end
