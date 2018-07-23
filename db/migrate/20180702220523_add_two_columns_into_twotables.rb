class AddTwoColumnsIntoTwotables < ActiveRecord::Migration[5.1]
  def change
	  add_column :orders, :uniqId, :string
	  add_column :order_histories, :uniqId, :string
  end
end
