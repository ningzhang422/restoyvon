class CreateDiningTables < ActiveRecord::Migration[5.1]
  def change
    create_table :dining_tables do |t|
      t.string :name
      t.integer :capacity
      t.string :group_name
      t.boolean :active
      t.text :comments
      t.timestamps
    end
  end
end
