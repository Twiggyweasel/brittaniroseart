class ChargesController < ApplicationController
  
  def new
    @billing = Billing.find_by_order_id(current_order)
    @order_items = current_order.order_items
  end
  def index
  
  end
  def create
    # Amount in cents
    #@amount = 500
    @amount = current_order.total
    
    @current_order = current_order
    
    
    
      
    customer = Stripe::Customer.create(
      :email => 'example@stripe.com',
      :card  => params[:stripeToken]
    )
  
    charge = Stripe::Charge.create(
      :customer    => customer.id,
      :amount      => (current_order.total * 100).to_i,
      :description => 'Rails Stripe customer',
      :currency    => 'usd'
    )
  @current_order.order_status_id = 2
  @current_order.save
  session[:order_id] = nil
  redirect_to root_path
  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to charges_path
  end
    private
      def order_params
        params.require(:order).permit(:order_status_id)
      end
end
