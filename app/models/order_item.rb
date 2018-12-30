class OrderItem < ApplicationRecord
	belongs_to :item
	belongs_to :order

	scope :item_is_rank, -> { joins(:item)
		.where("items.is_rank = true") }
	def amount
		quantity < 0 ? 0 : (amount_v.blank? ? (item.amount * quantity * (rate.nil? ? 1 : rate)).round(2) : (amount_v * quantity * (rate.nil? ? 1 : rate)).round(2))
	end
	def detail
		quantity < 0 ? "#{item.label} x #{quantity}(0) x #{(rate.nil? ? 1 : rate)} = 0" : "#{item.label} x #{quantity} x #{(rate.nil? ? 1 : rate)} = #{amount}"
	end

	
end
