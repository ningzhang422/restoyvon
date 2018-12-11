class AddPromotionRateIntoOrderItems < ActiveRecord::Migration[5.1]
  def up
	  add_column :order_items, :rate, :float
  end
end
