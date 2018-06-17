class ChangeFloatToDecimal < ActiveRecord::Migration[5.1]
  def change
	  change_column :items, :amount, :decimal, :precision => 8, :scale => 2
	  change_column :order_histories, :amount, :decimal, :precision => 8, :scale => 2
  end
end
