class ItemsController < ApplicationController

  def add_item
	  @item = Item.find(params[:id])
          @htmltext = ""

         if @item.update_attributes({:sold_number => @item.sold_number + 1})
		@htmltext = "ok";
         end
  end

  def remove_item
	@item = Item.find(params[:id])
        @htmltext = ""

         if @item.update_attributes({:sold_number => @item.sold_number - 1})
		@htmltext = "ok";
	 end
  end
end
