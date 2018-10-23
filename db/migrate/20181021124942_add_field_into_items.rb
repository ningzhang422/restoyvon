class AddFieldIntoItems < ActiveRecord::Migration[5.1]
  def change
	  add_column :items, :is_rank, :boolean, :default => true
  end


end
