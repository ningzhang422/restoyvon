class AddAmountVIntoOrderItems < ActiveRecord::Migration[5.1]
  def up
	  add_column :order_items, :amount_v, :float
  end

  def down
	  remove_column :order_items, :amount_v
  end
end
