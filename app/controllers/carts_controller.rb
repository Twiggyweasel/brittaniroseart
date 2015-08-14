class CartsController < ApplicationController
  def show
    if !current_order.order_status_id == 1
      new_order
    end
    
    
    @order_items = current_order.order_items
    @products = Product.all
  end
  
  private 
   def new_order
     Order.new
     session = [:order_id]
   end
end
