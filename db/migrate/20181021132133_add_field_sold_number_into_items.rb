class AddFieldSoldNumberIntoItems < ActiveRecord::Migration[5.1]
  def change
	  add_column :items, :sold_number, :integer, :default => 0
  end
end
