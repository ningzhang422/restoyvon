class Order < ApplicationRecord
	belongs_to :dining_table
	has_many :order_items
	has_many :order_histories
	
end
