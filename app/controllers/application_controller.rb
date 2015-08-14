class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :current_order
  #before_filter :new_order
  def current_order
    
  if !session[:order_id].nil?
    if Order.find(session[:order_id]).order_status_id == 2
      Order.new
    else
      Order.find(session[:order_id])
    end
   else
     Order.new
  end
  end
 # def new_order
    #if current_order.order_status_id > 1
     # Order.new
    #else
     # current_order = current_order
    #end
  #end
end
