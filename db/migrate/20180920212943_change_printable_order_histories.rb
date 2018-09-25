class ChangePrintableOrderHistories < ActiveRecord::Migration[5.1]
  def change
	  change_column :order_histories, :printable, :integer, :default => 0
  end
end
