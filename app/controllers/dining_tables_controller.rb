class DiningTablesController < ApplicationController
  def index
	  @dining_tables = DiningTable.where("current_order_id is not null")
  end

  def new
    @dining_tables = DiningTable.where("current_order_id is not null")

    @table = DiningTable.create({:name_of => "N° #{@dining_tables.count+1}", :current_order_id => nil})
    @montant =  0 
    respond_to do |format|
                  format.html { render :edit }
                  format.js { render :action => "edit", :layout => false }#:json => @table.to_json }
    end

  end

  def edit
    @table = DiningTable.where(id: params[:id]).first
    @montant = @table.active_order.blank? ? 0 : @table.active_order.order_items.map(&:amount).sum
    unless params[:order_id].blank?
	@order = @table.active_order	  
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
end
