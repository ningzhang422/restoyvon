class AddLineIdIntoOrderItems < ActiveRecord::Migration[5.1]
  def change
	  add_column :order_items, :line_id, :integer, default: 0
  end
end
