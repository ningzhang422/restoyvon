class AddFieldIntoDiningTables < ActiveRecord::Migration[5.1]
  def change
	  add_column :dining_tables, :is_occupied, :boolean, :default => false
  end
end
