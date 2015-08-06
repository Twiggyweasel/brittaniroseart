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
      redirect_to admin_path
    else
      render :new 
    end
  end
  
  def edit
    @products = Product.find(params[:id])
  end
  
  def update
    @products = Product.find(params[:id])
    
    if @products.update(product_params)
      redirect_to products_path
    else
      render :edit
    end
  end
  
  def show
    @products = Product.find(params[:id])
    
  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    @products = Product.all
  end
  end
    private 
      def product_params
        params.require(:product).permit(:name,:price, :featured, :description)
      end
  
end
