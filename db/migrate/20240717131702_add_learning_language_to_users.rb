class AddLearningLanguageToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :learning_language, :string
  end
end
