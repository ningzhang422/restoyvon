class AddUserInDiningTables < ActiveRecord::Migration[5.1]
  def change
	  add_column :dining_tables, :user_id, :integer
  end
end
