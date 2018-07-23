class DiningTablesController < ApplicationController
	 skip_before_action :verify_authenticity_token
  def index
	  @dining_tables = DiningTable.where("current_order_id is not null and (select is_valid from orders where id = current_order_id) is false")
  end

  def new
=begin
    @dining_tables = DiningTable.where("current_order_id is not null")

    @table = DiningTable.create({:name_of => "N° #{@dining_tables.count+1}", :current_order_id => nil})
    @montant =  0 
    respond_to do |format|
                  format.html { render :edit }
                  format.js { render :action => "edit", :layout => false }#:json => @table.to_json }
    end
=end
	  @dining_table = DiningTable.new 
	  render :layout => false
  end

  def create
     @dining_table = DiningTable.new(dining_table_params)
     if @dining_table.save
	     render :json => { :dining_table => @dining_table.to_json }, :status => 200
     else
	     render :json => { :errors => @dining_table.errors.full_messages }, :status => 422
     end
  end

  def edit
    @table = DiningTable.where(id: params[:id]).first
    @montant = @table.active_order.blank? ? 0 : @table.active_order.order_items.map(&:amount).sum
    unless params[:order_id].blank?
	@order = @table.active_order	  
	if @order.is_valid
		redirect_to dining_tables_url
	end
    end 
    respond_to do |format|
		  format.html { render :edit }
		  format.js { render :action => "edit", :layout => false }#:json => @table.to_json }
    end
  end

  def left_panel
    respond_to do |format|
                  format.js { render :action => "left_panel", :layout => false }#:json => @table.to_json }
    end
  end

private
  def dining_table_params
	  params.require(:dining_table).permit!
  end
end
