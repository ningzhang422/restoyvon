class ChangeColumnInOrders < ActiveRecord::Migration[5.1]
  def up
	  change_column(:orders, :amount, :boolean, :default => 0)
	  rename_column(:orders, :amount, :encour)
  end
end
