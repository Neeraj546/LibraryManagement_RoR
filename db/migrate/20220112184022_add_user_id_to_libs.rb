class AddUserIdToLibs < ActiveRecord::Migration[7.0]
  def change
    add_column :libs, :user_id, :integer
    add_index :libs, :user_id
  end
end
