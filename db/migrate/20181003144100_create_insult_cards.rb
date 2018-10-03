class CreateInsultCards < ActiveRecord::Migration[5.2]
  def change
    create_table :insult_cards do |t|
      t.references :user, foreign_key: true, :null => false
      t.references :insult, foreign_key: true, :null => false
      t.datetime :readed_at
      t.datetime :loved_at
    end

    add_index :insult_cards, [:user_id, :insult_id], :unique => true
  end
end
