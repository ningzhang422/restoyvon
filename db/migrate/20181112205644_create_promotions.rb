class CreatePromotions < ActiveRecord::Migration[5.1]
  def change
    create_table :promotions do |t|
      t.string :label, :short_label
      t.float :rate
      t.boolean :active
      t.timestamps
    end
  end
end
