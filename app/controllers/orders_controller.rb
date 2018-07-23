class OrdersController < ApplicationController
	skip_before_action :verify_authenticity_token


  def new
	  dining_table = DiningTable.new({name_of: "#{params[:dining_table_id]}",current_order_id: nil})
	  if dining_table.save 
		  order =  Order.new({dining_table_id: dining_table.id, quantity: params[:id]})
		  if order.save
			  dining_table.update_attributes({current_order_id: order.id})
			  render plain: "/dining_tables/#{dining_table.id}/edit", status: 200
		  else
			  render plain: "", status: 404
		  end
	  else
		  render plain: dining_table.errors.full_messages.first.to_s, status: 404 
	  end
  end

  def show
	  @order = Order.find(params[:id])
	  uniqId = "#{Time.new.strftime("%y%m%d")}#{SecureRandom.hex(1)}"

	  amount = @order.order_items.map(&:amount).sum
	  detail = @order.order_items.map(&:detail).join(";")

	  last_order_history = @order.order_histories.order(:created_at).try(:last)
	  if last_order_history.blank? 
	  	OrderHistory.create({:order_id => @order.id, :amount => amount, :detail => detail, :uniqId => uniqId})
		@order.uniqId = uniqId
		@order.save
          else		  
		if last_order_history.amount != amount || last_order_history.detail != detail
			if !@order.is_valid
			OrderHistory.create({:order_id => @order.id, :amount => amount, :detail => detail, :uniqId => uniqId}) 
			@order.uniqId = uniqId
                	@order.save
			end
		end
	  end
@order.encour = 1
@order.save

  end

  def dining_tables
	  redirect_to dining_tables_url
  end

  def print
    @order = Order.find(params[:id])
    uniqId = "#{Time.new.strftime("%y%m%d")}#{SecureRandom.hex(1)}"

    if @order.order_histories.length == 0
    	amount = @order.order_items.map(&:amount).sum
        detail = @order.order_items.map(&:detail).join(";")
        OrderHistory.create({:order_id => @order.id, :amount => amount, :detail => detail, :uniqId => uniqId})
                @order.uniqId = uniqId
                @order.save
    end

    last_order_history = @order.order_histories.order(:created_at).try(:last)
    last_order_history.uniqId = uniqId
    last_order_history.save

    @order.uniqId = uniqId
    @order.save

=begin
	    if @order.order_histories.length > 1 && (@order.order_histories - last_order_history).map(&:amount).include?(last_order_history.amount)
		    render plain: '', status: 200
	    else
	    detail = "\nTable : #{@order.dining_table.name_of}, Service : #{current_user.login},    Date : #{Time.now.strftime('%d/%m/%Y %I:%M%p')}\n_______________________________\n#{@order.order_items.map{|oi| "#{oi.item.label} X #{oi.quantity}" }.join("\n")}|#{request.base_url}/orders/#{@order.id}/valid"
	    render plain: detail, status: 200
	    last_order_history.printable = 0
	    last_order_history.save
	    end
=end
	detail = "\nTable : #{@order.dining_table.name_of}, Service : #{current_user.login},    Date : #{Time.now.strftime('%d/%m/%Y %I:%M%p')}\n_______________________________\n#{@order.order_items.map{|oi| "#{oi.item.label} X #{oi.quantity}" }.join("\n")}|#{request.base_url}|#{@order.id}|#{@order.uniqId}"
            render plain: detail, status: 200
            #last_order_history.printable = 0
	    #last_order_history.save
  end

  def finish
	  @order = Order.find(params[:id])
	  @order.encour = 0
	  @order.save
	  @order.dining_table.update_attributes({current_order_id: nil})
	  @dining_tables = DiningTable.where("current_order_id is not null and (select is_valid from orders where id = current_order_id) is false")
  end

  def valid
	  @order = Order.find(params[:id])
  end

  def cash
    @order = Order.find(params[:id])
    @order.update_attributes({is_valid: true, payment_type: "cash"})
    detail = "\nTable : #{@order.dining_table.name_of}, Service : #{current_user.login},    Date : #{Time.now.strftime('%d/%m/%Y %I:%M%p')}\n_______________________________\n#{@order.order_items.map{|oi| "#{oi.item.label} X #{oi.quantity}" }.join("\n")}|#{request.base_url}/orders/#{@order.id}/valid"
    render plain: detail, status: 200
  end
  def cart
    @order = Order.find(params[:id])
    @order.update_attributes({is_valid: true, payment_type: "cart"})
    detail = "\nTable : #{@order.dining_table.name_of}, Service : #{current_user.login},    Date : #{Time.now.strftime('%d/%m/%Y %I:%M%p')}\n_______________________________\n#{@order.order_items.map{|oi| "#{oi.item.label} X #{oi.quantity}" }.join("\n")}|#{request.base_url}/orders/#{@order.id}/valid"
    render plain: detail, status: 200
  end
  def ticket
    @order = Order.find(params[:id])
    @order.update_attributes({is_valid: true, payment_type: "ticket"})
    detail = "\nTable : #{@order.dining_table.name_of}, Service : #{current_user.login},    Date : #{Time.now.strftime('%d/%m/%Y %I:%M%p')}\n_______________________________\n#{@order.order_items.map{|oi| "#{oi.item.label} X #{oi.quantity}" }.join("\n")}|#{request.base_url}/orders/#{@order.id}/valid"
    render plain: detail, status: 200
  end

  def create
		  order = Order.new(order_params)
		  if order.save
			  order.dining_table.update_attributes({current_order_id: order.id})
	          end
  end

  def multiPay
    @order = Order.find(params[:id])
    #@order.update_attributes({is_valid: true, payment_type: "multi"})
    #detail = "\nTable : #{@order.dining_table.name_of}, Service : #{current_user.login},    Date : #{Time.now.strftime('%d/%m/%Y %I:%M%p')}\n_______________________________\n#{@order.order_items.map{|oi| "#{oi.item.label} X #{oi.quantity}" }.join("\n")}|#{request.base_url}/orders/#{@order.id}/valid"
    #render plain: detail, status: 200
    render :layout => false
  end

 
  def multiPayOk
    @order = Order.find(params[:id])
    @order.update_attributes({is_valid: true, payment_type: "multiPay", comments: params.to_s})
    detail = "\nTable : #{@order.dining_table.name_of}, Service : #{current_user.login},\nDate : #{Time.now.strftime('%d/%m/%Y %I:%M%p')}\n CB : #{params[:cart]}\n_______________________________\n#{@order.order_items.map{|oi| "#{oi.item.label} X #{oi.quantity}" }.join("\n")}|#{request.base_url}/orders/#{@order.id}/valid"
    render plain: detail, status: 200
  end

private
  def order_params
    params.require(:order).permit(:dining_table_id, :quantity)
  end
end
