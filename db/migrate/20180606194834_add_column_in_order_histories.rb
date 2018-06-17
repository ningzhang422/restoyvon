class AddColumnInOrderHistories < ActiveRecord::Migration[5.1]
  def change
	  add_column :order_histories, :printable, :boolean,:default => true
  end
end
