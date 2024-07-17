class AddTopicToChatrooms < ActiveRecord::Migration[7.1]
  def change
    add_column :chatrooms, :topic, :string
  end
end
