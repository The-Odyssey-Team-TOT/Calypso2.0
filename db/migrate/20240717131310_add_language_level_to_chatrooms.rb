class AddLanguageLevelToChatrooms < ActiveRecord::Migration[7.1]
  def change
    add_column :chatrooms, :language_level, :string
  end
end
