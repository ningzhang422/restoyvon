class AddPromotionIntoItems < ActiveRecord::Migration[5.1]
  def up
	  add_column :items, :promotion_id, :integer
  end

  def down
	remove_column :items, :promotion_id
  end
end
