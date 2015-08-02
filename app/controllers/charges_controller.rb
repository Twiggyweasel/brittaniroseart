class ChargesController < ApplicationController
  
  def new
    @billing = Billing.find_by_order_id(current_order)
    @order_items = current_order.order_items
  end

  def create
    # Amount in cents
    #@amount = 500
    @amount = current_order.total
    current_order.order_status_id = 2
    
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
  
  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to charges_path
  end
end
