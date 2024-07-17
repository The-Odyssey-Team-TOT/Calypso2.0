class AddSecurityLevelToChatrooms < ActiveRecord::Migration[7.1]
  def change
    add_column :chatrooms, :security_level, :string
  end
end
