class AddLanguageToChatrooms < ActiveRecord::Migration[7.1]
  def change
    add_column :chatrooms, :language, :string
  end
end
