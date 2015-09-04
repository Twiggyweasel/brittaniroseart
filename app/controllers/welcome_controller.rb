class WelcomeController < ApplicationController
   
   def index
      @products = Product.all
      @order_item = current_order.order_items.new
      
   end
   
   def info
   end
   
   def story
   end
   
   def order_lookup
      @order = Order.where(order_number: params[:order_number]).first
      
      if @order.present?
         redirect_to order_path(@order)
      else
         flash[:danger] = "No orders found."
      end
   end
end