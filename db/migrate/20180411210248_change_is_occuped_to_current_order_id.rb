class ChangeIsOccupedToCurrentOrderId < ActiveRecord::Migration[5.1]
  def up
	  change_column :dining_tables, :is_occupied, :integer, :null => true
	  rename_column :dining_tables, :is_occupied, :current_order_id
  end


  def down
	  change_column :dining_tables, :is_occupied, :boolean, :default => 0
	  rename_column :dining_tables, :current_order_id, :is_occupied
  end
end
