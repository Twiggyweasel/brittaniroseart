class ProductsController < ApplicationController
  def index
    @products = Product.all
    @order_item = current_order.order_items.new
    @category = Category.all
  end
  
  def new
    @products = Product.new
    @category = Category.all
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
    @category = Category.all
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
    @product = Product.find(params[:id])
    @related = Product.where("category_id = ?", @product.category_id ).limit(4)
    @order_item = current_order.order_items.new
  end 
  
  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    redirect_to admin_path
  end
  
    private 
      def product_params
        params.require(:product).permit(:name,:price, :category_id, :featured, :description, :picture)
      end
end

