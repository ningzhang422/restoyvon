class Order < ApplicationRecord
	belongs_to :dining_table
	has_many :order_items, dependent: :destroy
	has_many :order_histories, dependent: :destroy

	def last_trace
		order_histories.order('created_at desc').first	
	end

	def self.orders_today
		self.where("date(created_at) = '#{Date.today.to_s}'").where("is_valid is true")
	end

	def self.orders_today_all_amount
		self.where("date(created_at) = '#{Date.today.to_s}' and (comments is null or comments != 'cancel')").map{|a| a.try(:last_trace)}.map{|a| a.try(:amount)}.map(&:to_f).sum
	end

	def self.orders_today_all_people
		self.where("date(created_at) = '#{Date.today.to_s}' and (comments is null or comments != 'cancel')").map(&:quantity).sum
	end

	def self.orders_today_encour
                self.where("date(created_at) = '#{Date.today.to_s}' and (comments is null or comments != 'cancel')").where("is_valid is false")
        end



	def self.orders_today_cash_only
		self.orders_today.where("payment_type = 'cash'").map(&:last_trace).map(&:amount).map(&:to_f).sum #.map(&:amount)
	end
	def self.orders_today_cart_only
		self.orders_today.where("payment_type = 'cart'").map(&:last_trace).map(&:amount).map(&:to_f).sum #.map(&:amount)
	end
	def self.orders_today_ticket_only
		self.orders_today.where("payment_type = 'ticket'").map(&:last_trace).map(&:amount).map(&:to_f).sum #.map(&:amount)
	end
	def self.orders_today_cheque_only
		self.orders_today.where("payment_type = 'cheque'").map(&:last_trace).map(&:amount).map(&:to_f).sum #.map(&:amount)
	end
	def self.orders_today_multiPay
		self.orders_today.where("payment_type = 'multiPay'").map(&:last_trace).map(&:amount).map(&:to_f).sum #.map(&:amount)
	end

	def self.orders_today_cash_multi
		self.orders_today.where("payment_type = 'multiPay'").map(&:comments).map{|m| eval(m)['cash'].gsub('-','.').to_f}.sum
	end

	def self.orders_today_cart_multi
                self.orders_today.where("payment_type = 'multiPay'").map(&:comments).map{|m| eval(m)['cart'].gsub('-','.').to_f}.sum
        end

	def self.orders_today_ticket_multi
                self.orders_today.where("payment_type = 'multiPay'").map(&:comments).map{|m| eval(m)['tkresto'].gsub('-','.').to_f}.sum
        end

	def self.orders_today_cheque_multi
                self.orders_today.where("payment_type = 'multiPay'").map(&:comments).map{|m| eval(m)['cheque'].gsub('-','.').to_f}.sum
        end

end
