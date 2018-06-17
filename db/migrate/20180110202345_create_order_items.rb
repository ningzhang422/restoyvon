class CreateOrderItems < ActiveRecord::Migration[5.1]
  def change
    create_table :order_items do |t|
      t.integer :item_id, :order_id
      t.integer :quantity
      t.boolean :active, :default => true
      t.timestamps
    end
  end
end
