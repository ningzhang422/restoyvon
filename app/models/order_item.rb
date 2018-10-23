class OrderItem < ApplicationRecord
	belongs_to :item
	belongs_to :order

	scope :item_is_rank, -> { joins(:item)
		.where("items.is_rank = true") }
	def amount
		(item.amount * quantity).round(2)
	end
	def detail
		"#{item.label} x #{quantity} = #{amount}"
	end

	
end
