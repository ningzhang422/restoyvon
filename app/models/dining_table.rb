class DiningTable < ApplicationRecord
	has_many :orders

	validate :verif_table_name, on: [:create, :update]
	#validate :verif_table_name, on: :update
 
  def verif_table_name
	  errors.add(:base,"桌名已经占用！") unless DiningTable.where("name_of = ? and current_order_id is not null and (select is_valid from orders where id = current_order_id) is false", name_of).length == 0
  end

	def active_order
		Order.find(current_order_id) unless current_order_id.blank?
	end
end
