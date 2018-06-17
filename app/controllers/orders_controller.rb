class OrdersController < ApplicationController
	skip_before_action :verify_authenticity_token

  def show
	  @order = Order.find(params[:id])


	  amount = @order.order_items.map(&:amount).sum
	  detail = @order.order_items.map(&:detail).join(";")

	  last_order_history = @order.order_histories.order(:created_at).try(:last)
	  if last_order_history.blank? 
	  	OrderHistory.create({:order_id => @order.id, :amount => amount, :detail => detail})
          else		  
		if last_order_history.amount != amount || last_order_history.detail != detail
			OrderHistory.create({:order_id => @order.id, :amount => amount, :detail => detail})
		end
	  end
@order.encour = 1
@order.save

  end

  def print
    @order = Order.find(params[:id])
    last_order_history = @order.order_histories.order(:created_at).try(:last)
    if last_order_history.printable
	    if (@order.order_histories - last_order_history).map(&:amount).include?(last_order_history.amount)
		    render plain: '', status: 200
	    else
	    detail = "\nTable : #{@order.dining_table.name_of}, Service : #{current_user.login},    Date : #{Time.now.strftime('%d/%m/%Y %I:%M%p')}\n_______________________________\n#{@order.order_items.map{|oi| "#{oi.item.label} X #{oi.quantity}" }.join("\n")}|G#{rand(1000..9999)}A#{rand(1000..9999)}Q#{@order.order_items.map(&:amount).sum.to_s.gsub('.','D')}"
	    render plain: detail, status: 200
	    last_order_history.printable = 0
	    last_order_history.save
	    end
    else
	    render plain: '', status: 200
    end
  end

  def finish
	  @order = Order.find(params[:id])
	  @order.encour = 0
	  @order.save
	  @order.dining_table.update_attributes({current_order_id: nil})
	  @dining_tables = DiningTable.where("current_order_id is not null")
  end

  def create
		  order = Order.new(order_params)
		  if order.save
			  order.dining_table.update_attributes({current_order_id: order.id})
	          end
  end

private
  def order_params
    params.require(:order).permit(:dining_table_id, :quantity)
  end
end
