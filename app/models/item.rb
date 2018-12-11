class Item < ApplicationRecord
	belongs_to :promotion, optional: true
end
