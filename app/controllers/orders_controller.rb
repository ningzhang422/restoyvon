class OrdersController < ApplicationController
	skip_before_action :verify_authenticity_token


  def new
	  dining_table = DiningTable.new({name_of: "#{params[:dining_table_id]}",current_order_id: nil, user_id: current_user.id})
	  if dining_table.save 
		  order =  Order.new({dining_table_id: dining_table.id, quantity: params[:id]})
		  if order.save
			  #dining_table.update_attributes({current_order_id: order.id})
			  dining_table.update_attribute(:current_order_id, order.id);
			  render plain: "/dining_tables/#{dining_table.id}/edit", status: 200
		  else
			  render plain: "", status: 404
		  end
	  else
		  render plain: dining_table.errors.full_messages.first.to_s, status: 404 
	  end
  end

  def login
	  redirect_to login_path
  end

  def show
	  @order = Order.find(params[:id])
=begin
	  uniqId = define_uniqid SecureRandom.random_number(1000..9999)
	  #uniqId = Time.now.strftime("%m%d%H%M%S%L").to_s

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
=end
	#detail = "\nTable : #{@order.dining_table.name_of}, Service : #{current_user.login},    Date : #{Time.now.strftime('%d/%m/%Y %I:%M%p')}\n_______________________________\n#{@order.order_items.map{|oi| "#{oi.item.label} X #{oi.quantity}" }.join("\n")}|#{request.base_url}|#{@order.id}|#{@order.uniqId}"
        #render plain: detail, status: 200
  end

  def dining_tables
	  redirect_to dining_tables_url
  end

  def print
    @order = Order.find(params[:id])
    uniqId = define_uniqid SecureRandom.random_number(1000..9999) #Time.now.strftime("%m%d%H%M%S%L").to_s

    if @order.order_histories.length == 0
    	amount = @order.order_items.map(&:amount).sum
        detail = @order.order_items.map(&:detail).join(";")
        OrderHistory.create({:order_id => @order.id, :amount => amount, :detail => detail, :uniqId => uniqId, :printable => 1})
    else

	last_order_history = @order.order_histories.order(:created_at).try(:last)
	last_order_history.uniqId = uniqId
	last_order_history.printable = last_order_history.printable + 1
	last_order_history.amount = @order.order_items.map(&:amount).sum
	last_order_history.detail = @order.order_items.map(&:detail).join(";")
	last_order_history.save
    end

    @order.uniqId = uniqId
    @order.encour = 1
    @order.save

    total_amount = Setting.where(label: "show_amount_ticket").first.active ? "\nTotal : #{@order.order_histories.order(:created_at).try(:last).try(:amount)}" : ""

    detail = "\nTable : #{@order.dining_table.name_of}, Service : #{current_user.login},    Date : #{Time.now.strftime('%d/%m/%Y %I:%M%p')}\n_______________________________\n#{@order.order_items.order("line_id asc").map{|oi| (oi.quantity > 0 ? "#{oi.item.label} X #{oi.quantity}" : "#{oi.item.label} X #{oi.quantity}".split("").join("\u0336"))}.join("\n")}#{total_amount}|#{request.base_url}|#{@order.id}|#{@order.uniqId}"
        render plain: detail, status: 200
  end

  def change_table
	  dining_table = DiningTable.find(Order.find(params[:id]).dining_table_id)
	  if dining_table.update_attributes({name_of: params[:new_name]})
		@order = Order.find(params[:id])
          	uniqId = define_uniqid SecureRandom.random_number(1000..9999)		

		last_order_history = @order.order_histories.order(:created_at).try(:last)
		last_order_history.uniqId = uniqId
		last_order_history.printable = last_order_history.printable + 1
		last_order_history.save

		@order.uniqId = uniqId
		@order.save

		total_amount = Setting.where(label: "show_amount_ticket").first.active ? "\nTotal : #{last_order_history.try(:amount)}" : ""

		detail = "\nTable : #{dining_table.name_of}, Service : #{current_user.login},    Date : #{Time.now.strftime('%d/%m/%Y %I:%M%p')}\n_______________________________\n#{@order.order_items.order("line_id asc").map{|oi| (oi.quantity > 0 ? "#{oi.item.label} X #{oi.quantity}" : "#{oi.item.label} X #{oi.quantity}".split("").join("\u0336")) }.join("\n")}#{total_amount}|#{request.base_url}|#{@order.id}|#{@order.uniqId}|#{dining_table.name_of}"
		render plain: detail, status: 200
	  else
		render plain: dining_table.errors.full_messages.first.to_s, status: 404
	  end
  end

  def is_print
	order = Order.find(params[:id])
	last_order_history = order.order_histories.order(:created_at).try(:last)
	render plain: last_order_history.blank? ? false : order.order_histories.map(&:printable).sum > 0, status: 200
  end

  def finish
	  @order = Order.find(params[:id])
	  if @order.order_histories.size == 0 || @order.order_histories.order(:created_at).try(:last).printable == 0
		  @order.encour = 0
		  @order.comments = "cancel"
		  @order.save
		  @order.dining_table.update_attribute(:current_order_id,nil)
		  #dining_table = @order.dining_table
		  #dining_table.current_order_id = nil
		  #dining_table.save(validate:false)
		  @dining_tables = DiningTable.where("current_order_id is not null and (select is_valid from orders where id = current_order_id) is false")
	  else
		render plain: "non", status: 200
	  end
  end

  def valid
	  @order = Order.find(params[:id])
	  unless params[:promotion_id].blank?
		  if params[:promotion_id] == "0"
			  @order.order_items.each do |oi|
				  oi.update_attributes({:rate => nil})
			  end
		  else
			  p = Promotion.find(params[:promotion_id].to_i)
			  @order.order_items.each do |oi|
				if  p.items.map(&:id).include?(oi.item_id)
					oi.update_attributes({:rate => p.rate})
				end
			  end
		  end

		  last_order_history = @order.order_histories.order(:created_at).try(:last)
		  last_order_history.amount = @order.order_items.map(&:amount).sum.round(2)
		  last_order_history.detail = @order.order_items.map(&:detail).join(";")
		  last_order_history.save
	  end
  end

  def cash
    @order = Order.find(params[:id])
    @order.update_attributes({is_valid: true, payment_type: "cash", encour: false})
    @order.order_items.item_is_rank.each do |oi|
	    oi.item.update_attributes({:sold_number => oi.item.sold_number + oi.quantity})
    end
    detail = "\nTable : #{@order.dining_table.name_of}, Service : #{current_user.login},    Date : #{Time.now.strftime('%d/%m/%Y %I:%M%p')}\n_______________________________\n#{@order.order_items.map{|oi| "#{oi.item.label} X #{oi.quantity}" }.join("\n")}|#{request.base_url}/orders/#{@order.id}/valid"
    render plain: detail, status: 200
  end
  def cart
    @order = Order.find(params[:id])
    @order.update_attributes({is_valid: true, payment_type: "cart", encour: false})
    detail = "\nTable : #{@order.dining_table.name_of}, Service : #{current_user.login},    Date : #{Time.now.strftime('%d/%m/%Y %I:%M%p')}\n_______________________________\n#{@order.order_items.map{|oi| "#{oi.item.label} X #{oi.quantity}" }.join("\n")}\n CB : #{@order.order_items.map(&:amount).sum.round(2)}|#{request.base_url}/orders/#{@order.id}/valid"
    render plain: detail, status: 200
  end
  def ticket
    @order = Order.find(params[:id])
    @order.update_attributes({is_valid: true, payment_type: "ticket", encour: false})
    @order.order_items.item_is_rank.each do |oi|
	    oi.item.update_attributes({:sold_number => oi.item.sold_number + oi.quantity})
    end
    detail = "\nTable : #{@order.dining_table.name_of}, Service : #{current_user.login},    Date : #{Time.now.strftime('%d/%m/%Y %I:%M%p')}\n_______________________________\n#{@order.order_items.map{|oi| "#{oi.item.label} X #{oi.quantity}" }.join("\n")}|#{request.base_url}/orders/#{@order.id}/valid"
    render plain: detail, status: 200
  end
  def cheque
    @order = Order.find(params[:id])
    @order.update_attributes({is_valid: true, payment_type: "cheque", encour: false})
    @order.order_items.item_is_rank.each do |oi|
	    oi.item.update_attributes({:sold_number => oi.item.sold_number + oi.quantity})
    end
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
    @order.update_attributes({is_valid: true, payment_type: "multiPay", comments: params.to_s, encour: false})
    @order.order_items.item_is_rank.each do |oi|
	    oi.item.update_attributes({:sold_number => oi.item.sold_number + oi.quantity})
    end
    detail = "\nTable : #{@order.dining_table.name_of}, Service : #{current_user.login},\nDate : #{Time.now.strftime('%d/%m/%Y %I:%M%p')}\n CB : #{params[:cart]}\n_______________________________\n#{@order.order_items.map{|oi| "#{oi.item.label} X #{oi.quantity}" }.join("\n")}|#{request.base_url}/orders/#{@order.id}/valid"
    render plain: detail, status: 200
  end

private
  def order_params
    params.require(:order).permit(:dining_table_id, :quantity)
  end

  def define_uniqid uniqId
	  if Order.where(uniqId: uniqId).size == 0
		  return uniqId
	  else
		  define_uniqid SecureRandom.random_number(1000..9999)
	  end
  end
end
