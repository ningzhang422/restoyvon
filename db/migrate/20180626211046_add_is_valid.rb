class AddIsValid < ActiveRecord::Migration[5.1]
  def change
	  add_column :orders, :is_valid, :boolean, :default => false
  end
end
