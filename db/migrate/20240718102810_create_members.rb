class CreateMembers < ActiveRecord::Migration[7.1]
  def change
    create_table :members do |t|
      t.boolean :banned
      t.references :user, null: false, foreign_key: true
      t.references :chatroom, null: false, foreign_key: true

      t.timestamps
    end
  end
end
