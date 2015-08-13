class AdminController < ApplicationController 
  
  def show 
    @products = Product.all
    @orders = Order.all
  end
  
end