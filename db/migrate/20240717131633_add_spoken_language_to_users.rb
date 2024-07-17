class AddSpokenLanguageToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :spoken_language, :string
  end
end
