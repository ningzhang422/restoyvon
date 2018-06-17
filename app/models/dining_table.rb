class DiningTable < ApplicationRecord
	has_many :orders

	def active_order
		Order.find(current_order_id) unless current_order_id.blank?
	end
end
