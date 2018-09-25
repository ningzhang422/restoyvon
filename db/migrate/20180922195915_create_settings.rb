class CreateSettings < ActiveRecord::Migration[5.1]
  def up
    create_table :settings do |t|
      t.string :label
      t.string :label_long
      t.boolean :active, :default => true
      t.timestamps
    end

    execute <<-SQL
	insert into settings(label, active, created_at, updated_at)
	values ('show_cash',1,curdate(),curdate()),('show_cart',1,curdate(),curdate()),('show_cheque',1,curdate(),curdate()),('show_ticket',1,curdate(),curdate()),('show_total',1,curdate(),curdate()), ('show_total_people',1,curdate(),curdate()), ('show_cashPay',1,curdate(),curdate()),('show_cartPay',1,curdate(),curdate()),('show_chequePay',1,curdate(),curdate()),('show_ticketPay',1,curdate(),curdate()),('show_multiPay',1,curdate(),curdate());
    SQL
  end

  def down
	  drop_table :settings
  end
end
