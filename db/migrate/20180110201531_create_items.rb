class CreateItems < ActiveRecord::Migration[5.1]
  def change
    create_table :items do |t|
      t.string :label, :url
      t.float :amount
      t.integer :category_id
      t.timestamps
    end
  end
end
