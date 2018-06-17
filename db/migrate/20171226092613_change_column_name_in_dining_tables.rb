class ChangeColumnNameInDiningTables < ActiveRecord::Migration[5.1]
  def change
	  rename_column :dining_tables, :name, :table_name
  end
end
