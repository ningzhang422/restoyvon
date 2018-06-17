class CreateOrderHistories < ActiveRecord::Migration[5.1]
  def change
    create_table :order_histories do |t|
      t.integer :order_id
      t.decimal :amount
      t.text :detail
      t.timestamps
    end
  end
end
