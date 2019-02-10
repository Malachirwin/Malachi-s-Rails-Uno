class CreatePlayedCards < ActiveRecord::Migration[5.1]
  def change
    add_column :cards, :order, :integer, default: nil
    create_table :played_cards do |t|
      t.bigint :game_id

      t.timestamps
    end
  end
end
