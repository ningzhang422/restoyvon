class OrderItem < ApplicationRecord
	belongs_to :item
	belongs_to :order
	def amount
		(item.amount * quantity).round(2)
	end
	def detail
		"#{item.label} x #{quantity} = #{amount}"
	end
end
