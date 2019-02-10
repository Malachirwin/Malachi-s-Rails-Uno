class AddPlayedColumnToGame < ActiveRecord::Migration[5.1]
  def change
    add_column :cards, :played_cards_id, :bigint, default: nil
  end
end
