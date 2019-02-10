class CreateCards < ActiveRecord::Migration[5.1]
  def change
    create_table :cards do |t|
      t.string :color
      t.string :rank

      t.timestamps
    end
  end
end
