class OrderItemsController < ApplicationController
	def add_new_item
		@order_id = params[:order_id]
		@item_id = params[:id]
		@order = Order.find(@order_id)
		@item = Item.find(@item_id)
		htmltext = ""
		if OrderItem.where("order_id = ? and item_id = ?",@order_id,@item_id).length == 0
			if OrderItem.create({:order_id => @order_id, :item_id => @item_id, :quantity => 1})
			@order.order_items.each do |io|
				if io.quantity < 0
				htmltext += "<div class='col-50 tablet-25'>
				<div class='chip' style='padding:0 0 0 12px; background:#cc0000;'>
					<a href='/orders/#{io.order_id}/order_items/#{io.id}/add_item' data-remote='true'>
					<div class='chip-media bg-color-blue'>
						<i class='icon material-icons md-only'>add_circle</i>
					</div>
					</a>
					<div class='chip-label' style='width: 110px;'>#{io.item.label} x #{io.quantity}</div>
					<a href='/orders/#{io.order_id}/order_items/#{io.id}/remove_item' data-remote='true'>
					<div class='chip-media bg-color-red'>
						<i class='icon material-icons'>remove_circle</i>
					</div>
					</a>
				</div>
			     </div>"
				else
				htmltext += "<div class='col-50 tablet-25'>
				<div class='chip' style='padding:0 0 0 12px;'>
					<a href='/orders/#{io.order_id}/order_items/#{io.id}/add_item' data-remote='true'>
					<div class='chip-media bg-color-blue'>
						<i class='icon material-icons md-only'>add_circle</i>
					</div>
					</a>
					<div class='chip-label' style='width: 110px;'>#{io.item.label} x #{io.quantity}</div>
					<a href='/orders/#{io.order_id}/order_items/#{io.id}/remove_item' data-remote='true'>
					<div class='chip-media bg-color-red'>
						<i class='icon material-icons'>remove_circle</i>
					</div>
					</a>
				</div>
			     </div>"
			     	end
			end
			render json: {success: true, htmltext: htmltext,item_choosen: "item_", amount: helper.number_to_currency(@order.order_items.map{|oi| oi.quantity * oi.item.amount}.sum, :unit => "€") }, status: 200
			else
render json: {error: true}, status: 400
			end
		else
			if OrderItem.where("order_id = ? and item_id = ? and quantity > 0",@order_id,@item_id).first.update_attributes({:quantity => OrderItem.where("order_id = ? and item_id = ? and quantity > 0",@order_id,@item_id).first.quantity + 1})
				@order.order_items.each do |io|
                                if io.quantity < 0
                                htmltext += "<div class='col-50 tablet-25'>
                                <div class='chip' style='padding:0 0 0 12px; background:#cc0000;'>
                                        <a href='/orders/#{io.order_id}/order_items/#{io.id}/add_item' data-remote='true'>
                                        <div class='chip-media bg-color-blue'>
                                                <i class='icon material-icons md-only'>add_circle</i>
                                        </div>
                                        </a>
                                        <div class='chip-label' style='width: 110px;'>#{io.item.label} x #{io.quantity}</div>
                                        <a href='/orders/#{io.order_id}/order_items/#{io.id}/remove_item' data-remote='true'>
                                        <div class='chip-media bg-color-red'>
                                                <i class='icon material-icons'>remove_circle</i>
                                        </div>
                                        </a>
                                </div>
                             </div>"
                                else
                                htmltext += "<div class='col-50 tablet-25'>
                                <div class='chip' style='padding:0 0 0 12px;'>
                                        <a href='/orders/#{io.order_id}/order_items/#{io.id}/add_item' data-remote='true'>
                                        <div class='chip-media bg-color-blue'>
                                                <i class='icon material-icons md-only'>add_circle</i>
                                        </div>
                                        </a>
                                        <div class='chip-label' style='width: 110px;'>#{io.item.label} x #{io.quantity}</div>
                                        <a href='/orders/#{io.order_id}/order_items/#{io.id}/remove_item' data-remote='true'>
                                        <div class='chip-media bg-color-red'>
                                                <i class='icon material-icons'>remove_circle</i>
                                        </div>
                                        </a>
                                </div>
                             </div>"
                                end
                        end
				render json: {success: true, htmltext: htmltext,item_choosen: "item_#{OrderItem.where("order_id = ? and item_id = ? and quantity > 0",@order_id,@item_id).first.id}", amount: helper.number_to_currency(@order.order_items.map{|oi| oi.quantity * oi.item.amount}.sum, :unit => "€") }, status: 200
                        else
render json: {error: true}, status: 400
                        end
		end


	end
	def add_item
		#render :plain => params.inspect
		@order_id = params[:order_id]
		@order_item_id = params[:id]
		@order_item = OrderItem.find(@order_item_id)
		@item = @order_item.item
		@item_id = @item.id
		@order = Order.find(@order_id)
		htmltext = ""

		if @order_item.update_attributes({:quantity => @order_item.quantity + 1})
			if @order_item.quantity == 0
                                @order_item.destroy
                        end
			@order.order_items.each do |io|
				if io.quantity < 0
				htmltext += "<div class='col-50 tablet-25'>
				<div class='chip' style='padding:0 0 0 12px; background:#cc0000;'>
					<a href='/orders/#{io.order_id}/order_items/#{io.id}/add_item' data-remote='true'>
					<div class='chip-media bg-color-blue'>
						<i class='icon material-icons md-only'>add_circle</i>
					</div>
					</a>
					<div class='chip-label' style='width: 110px;'>#{io.item.label} x #{io.quantity}</div>
					<a href='/orders/#{io.order_id}/order_items/#{io.id}/remove_item' data-remote='true'>
					<div class='chip-media bg-color-red'>
						<i class='icon material-icons'>remove_circle</i>
					</div>
					</a>
				</div>
			     </div>"
				else
				htmltext += "<div class='col-50 tablet-25'>
				<div class='chip' style='padding:0 0 0 12px;'>
					<a href='/orders/#{io.order_id}/order_items/#{io.id}/add_item' data-remote='true'>
					<div class='chip-media bg-color-blue'>
						<i class='icon material-icons md-only'>add_circle</i>
					</div>
					</a>
					<div class='chip-label' style='width: 110px;'>#{io.item.label} x #{io.quantity}</div>
					<a href='/orders/#{io.order_id}/order_items/#{io.id}/remove_item' data-remote='true'>
					<div class='chip-media bg-color-red'>
						<i class='icon material-icons'>remove_circle</i>
					</div>
					</a>
				</div>
			     </div>"
			     	end
			end
			render json: {success: true, htmltext: htmltext,item_choosen: "item_#{@order_item.id}", amount: helper.number_to_currency(@order.order_items.map{|oi| oi.quantity * oi.item.amount}.sum, :unit => "€") }, status: 200
		else
			render json: {error: true}, status: 400
		end
=begin
		if OrderItem.where("order_id = ? and item_id = ? and quantity > 0", @order_id, @item_id).length > 0
			if OrderItem.where("order_id = ? and item_id = ? and quantity > 0", @order_id, @item_id).first.update_attributes({:quantity => OrderItem.where(order_id: @order_id,item_id: @item_id).first.quantity + 1})
				@order.order_items.each do |io|
                        		htmltext += "<div class='col-50 tablet-25'>
					<div class='chip' style='padding:0 0 0 12px;'>
						<a href='/orders/#{io.order_id}/order_items/#{io.item_id}/add_item' data-remote='true'>
                                                <div class='chip-media bg-color-blue'>
							<i class='icon material-icons md-only'>add_circle</i>
                                                </div>
						</a>
                                                <div class='chip-label' style='width: 110px;'>#{io.item.label} x #{io.quantity}</div>
						<a href='/orders/#{io.order_id}/order_items/#{io.item_id}/remove_item' data-remote='true'>
                                                <div class='chip-media bg-color-red'>
							<i class='icon material-icons'>remove_circle</i>
                                                </div>
						</a>
                                        </div>
    				     </div>"
                		end
				render json: {success: true, htmltext: htmltext,item_choosen: "item_#{@item.id}", amount: helper.number_to_currency(@order.order_items.map{|oi| oi.quantity * oi.item.amount}.sum, :unit => "€") }, status: 200
			else
				render json: {error: true}, status: 400
			end
		else
			if OrderItem.new({:item_id => @item_id, :order_id => @order_id, :quantity => 1}).save
				@order.order_items.each do |io|
                        		htmltext += "<div class='col-50 tablet-25'>
					<div class='chip' style='padding:0 0 0 12px;'>
						<a href='/orders/#{io.order_id}/order_items/#{io.item_id}/add_item' data-remote='true'>
                                                <div class='chip-media bg-color-blue'>
							<i class='icon material-icons md-only'>add_circle</i>
                                                </div>
						</a>
                                                <div class='chip-label' style='width: 110px;'>#{io.item.label} x #{io.quantity}</div>
						<a href='/orders/#{io.order_id}/order_items/#{io.item_id}/remove_item' data-remote='true'>
                                                <div class='chip-media bg-color-red'>
							<i class='icon material-icons'>remove_circle</i>
                                                </div>
						</a>
                                        </div>
    					</div>"
                		end
				render json: {success: true, htmltext: htmltext, item_choosen: "item_#{@item.id}", amount: helper.number_to_currency(@order.order_items.map{|oi| oi.quantity * oi.item.amount}.sum, :unit => "€")}, status: 200
                        else
                                render json: {error: true}, status: 400
                        end
			
		end
=end
	end

	def remove_item
		@order_id = params[:order_id]
                @order_item_id = params[:id]
                @order_item = OrderItem.find(@order_item_id)
                @item = @order_item.item
                @item_id = @item.id
                @order = Order.find(@order_id)
		htmltext = ""

			#if OrderItem.where(order_id: @order_id,item_id: @item_id).first.update_attributes({:quantity => OrderItem.where(order_id: @order_id,item_id: @item_id).first.quantity - 1})
		#		if OrderItem.where(order_id: @order_id,item_id: @item_id).first.quantity == 0
		#			OrderItem.where(order_id: @order_id,item_id: @item_id).first.destroy
		#		end

		if OrderItem.where("order_id = ? and item_id = ? and quantity < 0",@order_id,@item_id).length > 0
			@order_item_moin = OrderItem.where("order_id = ? and item_id = ? and quantity < 0",@order_id,@item_id).first
			if @order_item_moin.update_attributes({:quantity => @order_item_moin.quantity - 1})
				@order.order_items.each do |io|
					if io.quantity < 0
                        		htmltext += "<div class='col-50 tablet-25'>
        				<div class='chip' style='padding:0 0 0 12px; background:#cc0000;'>
						<a href='/orders/#{io.order_id}/order_items/#{io.id}/add_item' data-remote='true'>
                				<div class='chip-media bg-color-blue'>
							<i class='icon material-icons md-only'>add_circle</i>
                				</div>
						</a>
						<div class='chip-label' style='width: 110px;'>#{io.item.label} x #{io.quantity}</div>
						<a href='/orders/#{io.order_id}/order_items/#{io.id}/remove_item' data-remote='true'>
                				<div class='chip-media bg-color-red'>
							<i class='icon material-icons'>remove_circle</i>
                				</div>
						</a>
        			        </div>
    				     </div>"
					
					else
                        		htmltext += "<div class='col-50 tablet-25'>
        				<div class='chip' style='padding:0 0 0 12px;'>
						<a href='/orders/#{io.order_id}/order_items/#{io.id}/add_item' data-remote='true'>
                				<div class='chip-media bg-color-blue'>
							<i class='icon material-icons md-only'>add_circle</i>
                				</div>
						</a>
						<div class='chip-label' style='width: 110px;'>#{io.item.label} x #{io.quantity}</div>
						<a href='/orders/#{io.order_id}/order_items/#{io.id}/remove_item' data-remote='true'>
                				<div class='chip-media bg-color-red'>
							<i class='icon material-icons'>remove_circle</i>
                				</div>
						</a>
        			        </div>
    				     </div>"
				     	end
                		end
				render json: {success: true, htmltext: htmltext,item_choosen: "item_#{@item.id}", amount: helper.number_to_currency(@order.order_items.map{|oi| oi.quantity * oi.item.amount}.sum, :unit => "€") }, status: 200
			else
				render json: {error: true}, status: 400
			end
		else
			if OrderItem.create({:order_id => @order_id, :item_id => @item_id, :quantity => -1})
				@order.order_items.each do |io|
					if io.quantity < 0
                        		htmltext += "<div class='col-50 tablet-25'>
        				<div class='chip' style='padding:0 0 0 12px; background:#cc0000;'>
						<a href='/orders/#{io.order_id}/order_items/#{io.id}/add_item' data-remote='true'>
                				<div class='chip-media bg-color-blue'>
							<i class='icon material-icons md-only'>add_circle</i>
                				</div>
						</a>
						<div class='chip-label' style='width: 110px;'>#{io.item.label} x #{io.quantity}</div>
						<a href='/orders/#{io.order_id}/order_items/#{io.id}/remove_item' data-remote='true'>
                				<div class='chip-media bg-color-red'>
							<i class='icon material-icons'>remove_circle</i>
                				</div>
						</a>
        			        </div>
    				     </div>"
					
					else
                        		htmltext += "<div class='col-50 tablet-25'>
        				<div class='chip' style='padding:0 0 0 12px;'>
						<a href='/orders/#{io.order_id}/order_items/#{io.id}/add_item' data-remote='true'>
                				<div class='chip-media bg-color-blue'>
							<i class='icon material-icons md-only'>add_circle</i>
                				</div>
						</a>
						<div class='chip-label' style='width: 110px;'>#{io.item.label} x #{io.quantity}</div>
						<a href='/orders/#{io.order_id}/order_items/#{io.id}/remove_item' data-remote='true'>
                				<div class='chip-media bg-color-red'>
							<i class='icon material-icons'>remove_circle</i>
                				</div>
						</a>
        			        </div>
    				     </div>"
				     	end
                		end
				render json: {success: true, htmltext: htmltext,item_choosen: "item_#{@item.id}", amount: helper.number_to_currency(@order.order_items.map{|oi| oi.quantity * oi.item.amount}.sum, :unit => "€") }, status: 200
			else
				render json: {error: true}, status: 400
	                end
		end
	


	end


  def helper
    @helper ||= Class.new do
      include ActionView::Helpers::NumberHelper
    end.new
  end
end