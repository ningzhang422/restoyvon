class ChangeColumnTablenameInDiningTables < ActiveRecord::Migration[5.1]
  def change
	  rename_column :dining_tables, :table_name, :name_of
  end
end
