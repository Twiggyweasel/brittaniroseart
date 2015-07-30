class ProductsController < ApplicationController
  def index
    @products = Product.all
    @order_item = current_order.order_items.new
  end
  
  def new
    @products = Product.new
  end
  
  def create 
    @products = Product.new(product_params)
    
    if @products.save
      redirect_to products_path
    else
      render :new 
    end
  end
  
  
  private 
    def product_params
      params.require(:product).permit(:name,:price, :featured)
    end
  
end
