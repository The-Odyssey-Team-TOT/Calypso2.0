class CreateWalls < ActiveRecord::Migration[7.1]
  def change
    create_table :walls do |t|
      t.references :chatroom, null: false, foreign_key: true

      t.timestamps
    end
  end
end
