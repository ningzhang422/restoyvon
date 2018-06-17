class CreateOrders < ActiveRecord::Migration[5.1]
  def change
    create_table :orders do |t|
      t.integer :dining_table_id
      t.integer :quantity
      t.decimal :amount
      t.text :comments
      t.timestamps
    end
  end
end
