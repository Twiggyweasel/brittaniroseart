class OrdersController < ApplicationController
  def show
    @order = Order.find(params[:id])
  end
  
  def edit
    @order = Order.find(params[:id])
    @status = OrderStatus.all
  end
  
  def update
    @order = Order.find(params[:id])
    
    if @order.update(order_params)
      flash[:success] = "Order Successfully updated"
      redirect_to order_path(@order)
    else
      render :edit
    end
  end
  
  private
    def order_params
    params.require(:order).permit(:order_status_id,:tracking)
    end
end