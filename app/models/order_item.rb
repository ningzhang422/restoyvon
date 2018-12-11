class OrderItem < ApplicationRecord
	belongs_to :item
	belongs_to :order

	scope :item_is_rank, -> { joins(:item)
		.where("items.is_rank = true") }
	def amount
		amount_v.blank? ? (item.amount * quantity * (rate.nil? ? 1 : rate)).round(2) : (amount_v * quantity * (rate.nil? ? 1 : rate)).round(2)
	end
	def detail
		"#{item.label} x #{quantity} x #{(rate.nil? ? 1 : rate)} = #{amount}"
	end

	
end
