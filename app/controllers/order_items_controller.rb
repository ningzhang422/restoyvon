class OrderItemsController < ApplicationController
	def add_new_item
		@order_id = params[:order_id]
		@item_id = params[:id]
		@order = Order.find(@order_id)
		@item = Item.find(@item_id)
		htmltext = ""
		if OrderItem.where("order_id = ? and item_id = ? and quantity > 0",@order_id,@item_id).length == 0
			#lines_number = @order.order_items.length + 1
			order_item = OrderItem.new({:order_id => @order_id, :item_id => @item_id, :quantity => 1})
			if order_item.save #OrderItem.create({:order_id => @order_id, :item_id => @item_id, :quantity => 1})
			   order_item.line_id = @order.order_items.length + 1
			   order_item.save
			   @order.order_items.order("order_items.line_id desc").each do |io|
				if io.id == order_item.id 
					bg = "bg-color-green"
				else	
					bg = ""
				end
				if io.quantity < 0
				htmltext += "<div class='col-50 tablet-25'>
				<div class='chip #{bg}' style='padding:0 0 0 12px; background:#ECAD9E;width:100%;'>
					<div class='chip-label' style='width: 100%;'>#{io.item.label} #{io.try(:amount_v)} <br><span class='badge color-red'> #{io.quantity}</span></div>
				</div>
			     </div>"
				else
				htmltext += "<div class='col-50 tablet-25'>
				<div class='chip #{bg}' style='padding:0 0 0 12px;width: 100%;'>
					<a href='/orders/#{io.order_id}/order_items/#{io.id}/add_item' data-remote='true'>
					<div class='chip-media bg-color-blue'>
						<i class='icon material-icons md-only'>add_circle</i>
					</div>
					</a>
					<div class='chip-label' style='width: 100%;'>#{io.item.label} #{io.try(:amount_v)} <br><span class='badge color-red'> #{io.quantity}</span></div>
					<a href='/orders/#{io.order_id}/order_items/#{io.id}/remove_item' data-remote='true'>
					<div class='chip-media bg-color-red'>
						<i class='icon material-icons'>remove_circle</i>
					</div>
					</a>
				</div>
			     </div>"
			     	end
			end
				render json: {success: true, htmltext: htmltext,item_choosen: "item_#{@item_id}", amount: helper.number_to_currency(@order.order_items.map{|oi| oi.amount}.sum, :unit => "€") }, status: 200
			else
				render json: {error: true}, status: 400
			end
		else
			order_item = OrderItem.where("order_id = ? and item_id = ? and quantity > 0",@order_id,@item_id).first
			if order_item.update_attributes({:quantity => OrderItem.where("order_id = ? and item_id = ? and quantity > 0",@order_id,@item_id).first.quantity + 1})
				@order.order_items.order("order_items.updated_at desc, order_items.line_id desc").each do |io|
				if io.id == order_item.id
                                        bg = "bg-color-green"
                                else
                                        bg = ""
                                end
                                if io.quantity < 0
                                htmltext += "<div class='col-50 tablet-25'>
                                <div class='chip #{bg}' style='padding:0 0 0 12px; background:#ECAD9E;width:100%;'>
                                        <div class='chip-label' style='width: 100%;'>#{io.item.label} #{io.try(:amount_v)} <br><span class='badge color-red'> #{io.quantity}</span></div>
                                </div>
                             </div>"
                                else
                                htmltext += "<div class='col-50 tablet-25'>
                                <div class='chip #{bg}' style='padding:0 0 0 12px;width: 100%;'>
                                        <a href='/orders/#{io.order_id}/order_items/#{io.id}/add_item' data-remote='true'>
                                        <div class='chip-media bg-color-blue'>
                                                <i class='icon material-icons md-only'>add_circle</i>
                                        </div>
                                        </a>
                                        <div class='chip-label' style='width: 100%;'>#{io.item.label} #{io.try(:amount_v)} <br><span class='badge color-red'> #{io.quantity}</span></div>
                                        <a href='/orders/#{io.order_id}/order_items/#{io.id}/remove_item' data-remote='true'>
                                        <div class='chip-media bg-color-red'>
                                                <i class='icon material-icons'>remove_circle</i>
                                        </div>
                                        </a>
                                </div>
                             </div>"
                                end
                        end
				render json: {success: true, htmltext: htmltext,item_choosen: "item_#{OrderItem.where("order_id = ? and item_id = ? and quantity > 0",@order_id,@item_id).first.id}", amount: helper.number_to_currency(@order.order_items.map{|oi| oi.amount}.sum, :unit => "€") }, status: 200
                        else
render json: {error: true}, status: 400
                        end
		end


	end


	def add_new_item_sup 
		@order_id = params[:order_id]
		@item_id = params[:id]
		@order = Order.find(@order_id)
		@item = Item.find(@item_id)
		htmltext = ""
		if OrderItem.where("order_id = ? and item_id = ? and amount_v = ? and quantity > 0",@order_id,@item_id, params[:amount_v].to_f).length == 0
			#lines_number = @order.order_items.length + 1
			order_item = OrderItem.new({:order_id => @order_id, :item_id => @item_id, :quantity => 1, :amount_v => params[:amount_v]})
			if order_item.save #OrderItem.create({:order_id => @order_id, :item_id => @item_id, :quantity => 1})
			   order_item.line_id = @order.order_items.length + 1
			   order_item.save
			@order.order_items.order("line_id desc").each do |io|
				if io.id == order_item.id
                                        bg = "bg-color-green"
                                else
                                        bg = ""
                                end
				if io.quantity < 0
				htmltext += "<div class='col-50 tablet-25'>
				<div class='chip #{bg}' style='padding:0 0 0 12px; background:#ECAD9E;width:100%;'>
					<div class='chip-label' style='width: 100%;'>#{io.item.label} #{io.try(:amount_v)} <br><span class='badge color-red'> #{io.quantity}</span></div>
				</div>
			     </div>"
				else
				htmltext += "<div class='col-50 tablet-25'>
				<div class='chip #{bg}' style='padding:0 0 0 12px;width: 100%;'>
					<a href='/orders/#{io.order_id}/order_items/#{io.id}/add_item' data-remote='true'>
					<div class='chip-media bg-color-blue'>
						<i class='icon material-icons md-only'>add_circle</i>
					</div>
					</a>
					<div class='chip-label' style='width: 100%;'>#{io.item.label} #{io.try(:amount_v)} <br><span class='badge color-red'> #{io.quantity}</span></div>
					<a href='/orders/#{io.order_id}/order_items/#{io.id}/remove_item' data-remote='true'>
					<div class='chip-media bg-color-red'>
						<i class='icon material-icons'>remove_circle</i>
					</div>
					</a>
				</div>
			     </div>"
			     	end
			end
				render json: {success: true, htmltext: htmltext,item_choosen: "item_#{@item_id}", amount: helper.number_to_currency(@order.order_items.map{|oi| oi.amount}.sum, :unit => "€") }, status: 200
			else
				render json: {error: true}, status: 400
			end
		else
			order_item = OrderItem.where("order_id = ? and item_id = ? and quantity > 0",@order_id,@item_id).first
			if order_item.update_attributes({:quantity => OrderItem.where("order_id = ? and item_id = ? and quantity > 0",@order_id,@item_id).first.quantity + 1})
				@order.order_items.order("line_id desc").each do |io|
				if io.id == order_item.id
                                        bg = "bg-color-green"
                                else
                                        bg = ""
                                end
                                if io.quantity < 0
                                htmltext += "<div class='col-50 tablet-25'>
                                <div class='chip #{bg}' style='padding:0 0 0 12px; background:#ECAD9E;width:100%;'>
                                        <div class='chip-label' style='width: 100%;'>#{io.item.label} #{io.try(:amount_v)} <br><span class='badge color-red'> #{io.quantity}</span></div>
                                </div>
                             </div>"
                                else
                                htmltext += "<div class='col-50 tablet-25'>
                                <div class='chip #{bg}' style='padding:0 0 0 12px;width: 100%;'>
                                        <a href='/orders/#{io.order_id}/order_items/#{io.id}/add_item' data-remote='true'>
                                        <div class='chip-media bg-color-blue'>
                                                <i class='icon material-icons md-only'>add_circle</i>
                                        </div>
                                        </a>
                                        <div class='chip-label' style='width: 100%;'>#{io.item.label} #{io.try(:amount_v)} <br><span class='badge color-red'> #{io.quantity}</span></div>
                                        <a href='/orders/#{io.order_id}/order_items/#{io.id}/remove_item' data-remote='true'>
                                        <div class='chip-media bg-color-red'>
                                                <i class='icon material-icons'>remove_circle</i>
                                        </div>
                                        </a>
                                </div>
                             </div>"
                                end
                        end
                                render json: {success: true, htmltext: htmltext,item_choosen: "item_#{OrderItem.where("order_id = ? and item_id = ? and quantity > 0",@order_id,@item_id).first.id}", amount: helper.number_to_currency(@order.order_items.map{|oi| oi.amount}.sum, :unit => "€") }, status: 200
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
		@amount_v = @order_item.try(:amount_v)
		@item = @order_item.item
		@item_id = @item.id
		@order = Order.find(@order_id)
		htmltext = ""
		if OrderItem.where("order_id = ? and item_id = ? and #{@amount_v.blank? ? "amount_v is ?" : "amount_v= ?"} and quantity < 0",@order_id,@item_id, @amount_v).length > 0
			@order_item_moin = OrderItem.where("order_id = ? and item_id = ? and #{@amount_v.blank? ? "amount_v is ?" : "amount_v= ?"} and quantity < 0",@order_id,@item_id, @amount_v).first
                                if @order_item_moin.update_attributes({:quantity => @order_item_moin.quantity + 1})
				 	if @order_item_moin.quantity == 0
						@order_item_moin.destroy
					end
                                        @order.order_items.order("order_items.created_at DESC").each do |io|
                                                if io.quantity < 0
                                                htmltext += "<div class='col-50 tablet-25'>
                                                <div class='chip' style='padding:0 0 0 12px; background:#ECAD9E;width:100%;'>
                                                        <div class='chip-label' style='width: 100%;'>#{io.item.label} #{io.try(:amount_v)} <br><span class='badge color-red'> #{io.quantity}</span></div>
                                                </div>
                                             </div>"

                                                else
                                                htmltext += "<div class='col-50 tablet-25'>
                                                <div class='chip' style='padding:0 0 0 12px;width: 100%;'>
                                                        <a href='/orders/#{io.order_id}/order_items/#{io.id}/add_item' data-remote='true'>
                                                        <div class='chip-media bg-color-blue'>
                                                                <i class='icon material-icons md-only'>add_circle</i>
                                                        </div>
                                                        </a>
                                                        <div class='chip-label' style='width: 100%;'>#{io.item.label} #{io.try(:amount_v)} <br><span class='badge color-red'> #{io.quantity}</span></div>
                                                        <a href='/orders/#{io.order_id}/order_items/#{io.id}/remove_item' data-remote='true'>
                                                        <div class='chip-media bg-color-red'>
                                                                <i class='icon material-icons'>remove_circle</i>
                                                        </div>
                                                        </a>
                                                </div>
                                             </div>"
                                                end
                                        end
                                        render json: {success: true, htmltext: htmltext,item_choosen: "item_#{@item.id}", amount: helper.number_to_currency(@order.order_items.map{|oi| oi.amount}.sum, :unit => "€") }, status: 200
                                else
                                        render json: {error: true}, status: 400
                                end
		else
			if @order_item.update_attributes({:quantity => @order_item.quantity + 1})
				if @order_item.quantity == 0
					@order_item.destroy
				end
				@order.order_items.order("order_items.created_at DESC").each do |io|
					if io.quantity < 0
					htmltext += "<div class='col-50 tablet-25'>
					<div class='chip' style='padding:0 0 0 12px; background:#ECAD9E;width:100%;'>
						<div class='chip-label' style='width: 100%;'>#{io.item.label} #{io.try(:amount_v)} <br><span class='badge color-red'> #{io.quantity}</span></div>
					</div>
				     </div>"
					else
					htmltext += "<div class='col-50 tablet-25'>
					<div class='chip' style='padding:0 0 0 12px;width: 100%;'>
						<a href='/orders/#{io.order_id}/order_items/#{io.id}/add_item' data-remote='true'>
						<div class='chip-media bg-color-blue'>
							<i class='icon material-icons md-only'>add_circle</i>
						</div>
						</a>
						<div class='chip-label' style='width: 100%;'>#{io.item.label} #{io.try(:amount_v)} <br><span class='badge color-red'> #{io.quantity}</span></div>
						<a href='/orders/#{io.order_id}/order_items/#{io.id}/remove_item' data-remote='true'>
						<div class='chip-media bg-color-red'>
							<i class='icon material-icons'>remove_circle</i>
						</div>
						</a>
					</div>
				     </div>"
					end
				end
				render json: {success: true, htmltext: htmltext,item_choosen: "item_#{@order_item.id}", amount: helper.number_to_currency(@order.order_items.map{|oi| oi.amount}.sum, :unit => "€") }, status: 200
			else
				render json: {error: true}, status: 400
			end
		end
	end

	def remove_item
		@order_id = params[:order_id]
                @order_item_id = params[:id]
                @order_item = OrderItem.find(@order_item_id)
		@amount_v = @order_item.try(:amount_v)
                @item = @order_item.item
                @item_id = @item.id
                @order = Order.find(@order_id)
		htmltext = ""

		if @order.encour == false 
			if @order_item.update_attributes({:quantity => @order_item.quantity - 1}) #OrderItem.where(order_id: @order_id, item_id: @item_id).first.update_attributes({:quantity => OrderItem.where(order_id: @order_id,item_id: @item_id).first.quantity - 1}) # :quantity => -1})
				if @order_item.quantity == 0 # OrderItem.where(order_id: @order_id,item_id: @item_id).first.quantity == 0
					@order_item.destroy #OrderItem.where(order_id: @order_id,item_id: @item_id).first.destroy
				end
				@order.order_items.each do |io|
						htmltext += "<div class='col-50 tablet-25'>
						<div class='chip' style='padding:0 0 0 12px;width: 100%;'>
							<a href='/orders/#{io.order_id}/order_items/#{io.id}/add_item' data-remote='true'>
							<div class='chip-media bg-color-blue'>
								<i class='icon material-icons md-only'>add_circle</i>
							</div>
							</a>
							<div class='chip-label' style='width: 100%;'>#{io.item.label} #{io.try(:amount_v)} <br><span class='badge color-red'> #{io.quantity}</span></div>
							<a href='/orders/#{io.order_id}/order_items/#{io.id}/remove_item' data-remote='true'>
							<div class='chip-media bg-color-red'>
								<i class='icon material-icons'>remove_circle</i>
							</div>
							</a>
						</div>
					     </div>"
					end
					render json: {success: true, htmltext: htmltext,item_choosen: "item_#{@item.id}", amount: helper.number_to_currency(@order.order_items.map{|oi| oi.amount}.sum, :unit => "€") }, status: 200
			else
				render json: {error: true}, status: 400
			end
		else
			if @order_item.update_attributes({:quantity => @order_item.quantity - 1})
					if @order_item.quantity == 0 # OrderItem.where(order_id: @order_id,item_id: @item_id).first.quantity == 0
						@order_item.destroy #OrderItem.where(order_id: @order_id,item_id: @item_id).first.destroy
					end
			oi_moins = OrderItem.where("order_id = ? and item_id = ? and #{@amount_v.blank? ? "amount_v is ?" : "amount_v= ?"} and quantity < 0",@order_id,@item_id, @amount_v)
			if oi_moins.length > 0
				#if oi_moins.first.quantity.abs < OrderItem.where("order_id = ? and item_id = ? and #{@amount_v.blank? ? "amount_v is ?" : "amount_v= ?"} and quantity > 0",@order_id,@item_id, @amount_v).first.quantity
					@order_item_moin = oi_moins.first
					if @order_item_moin.update_attributes({:quantity => @order_item_moin.quantity - 1})
						@order.order_items.order("order_items.created_at DESC").each do |io|
							if io.quantity < 0
							htmltext += "<div class='col-50 tablet-25'>
							<div class='chip' style='padding:0 0 0 12px; background:#ECAD9E;width:100%;'>
								<div class='chip-label' style='width: 100%;'>#{io.item.label} #{io.try(:amount_v)} <br><span class='badge color-red'> #{io.quantity}</span></div>
							</div>
						     </div>"
							else
							htmltext += "<div class='col-50 tablet-25'>
							<div class='chip' style='padding:0 0 0 12px;width: 100%;'>
								<a href='/orders/#{io.order_id}/order_items/#{io.id}/add_item' data-remote='true'>
								<div class='chip-media bg-color-blue'>
									<i class='icon material-icons md-only'>add_circle</i>
								</div>
								</a>
								<div class='chip-label' style='width: 100%;'>#{io.item.label} #{io.try(:amount_v)} <br><span class='badge color-red'> #{io.quantity}</span></div>
								<a href='/orders/#{io.order_id}/order_items/#{io.id}/remove_item' data-remote='true'>
								<div class='chip-media bg-color-red'>
									<i class='icon material-icons'>remove_circle</i>
								</div>
								</a>
							</div>
						     </div>"
							end
						end
						render json: {success: true, htmltext: htmltext,item_choosen: "item_#{@item.id}", amount: helper.number_to_currency(@order.order_items.map{|oi| oi.amount}.sum, :unit => "€") }, status: 200
					else
						render json: {error: true}, status: 400
					end
				#else
				#	render json: {error: true}, status: 400
				#end
			else
				if OrderItem.create({:order_id => @order_id, :item_id => @item_id, :quantity => -1, :amount_v => @amount_v ,:line_id => @order_item.line_id, :created_at => @order_item.created_at})
					@order.order_items.order("order_items.created_at DESC").each do |io|
						if io.quantity < 0
						htmltext += "<div class='col-50 tablet-25'>
						<div class='chip' style='padding:0 0 0 12px; background:#ECAD9E;width:100%;'>
							<div class='chip-label' style='width: 100%;'>#{io.item.label} #{io.try(:amount_v)}<br><span class='badge color-red'> #{io.quantity}</span></div>
						</div>
					     </div>"
						
						else
						htmltext += "<div class='col-50 tablet-25'>
						<div class='chip' style='padding:0 0 0 12px;width: 100%;'>
							<a href='/orders/#{io.order_id}/order_items/#{io.id}/add_item' data-remote='true'>
							<div class='chip-media bg-color-blue'>
								<i class='icon material-icons md-only'>add_circle</i>
							</div>
							</a>
							<div class='chip-label' style='width: 100%;'>#{io.item.label} #{io.try(:amount_v)}<br><span class='badge color-red'> #{io.quantity}</span></div>
							<a href='/orders/#{io.order_id}/order_items/#{io.id}/remove_item' data-remote='true'>
							<div class='chip-media bg-color-red'>
								<i class='icon material-icons'>remove_circle</i>
							</div>
							</a>
						</div>
					     </div>"
						end
					end
					render json: {success: true, htmltext: htmltext,item_choosen: "item_#{@item.id}", amount: helper.number_to_currency(@order.order_items.map{|oi| oi.amount}.sum, :unit => "€") }, status: 200
				else
					render json: {error: true}, status: 400
				end
			end
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
