class CreateGames < ActiveRecord::Migration[5.1]
  def change
    add_column :decks, :game_id, :bigint
    add_column :cards, :game_id, :bigint, default: nil
    add_column :cards, :player_id, :bigint, default: nil
    create_table :games do |t|
      t.integer :player_turn, default: 0
      t.string :direction, default: "Clockwise"

      t.timestamps
    end
  end
end
