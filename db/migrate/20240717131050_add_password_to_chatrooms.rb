class AddPasswordToChatrooms < ActiveRecord::Migration[7.1]
  def change
    add_column :chatrooms, :password, :string
  end
end
