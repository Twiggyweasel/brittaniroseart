class BillingsController < ApplicationController
  
  def new
    @billing = Billing.new
  end
  
  def create
    @billing = Billing.new(billings_params)
    @billing.order_id = current_order.id
    if @billing.save
      
      redirect_to new_charge_path 
    else
      render :new
    end
  end
  
  def edit
    @billing = Billing.find(params[:id])
  end
  
  def update
    @billing = Billing.find(params[:id])
    
    if @billing.update(billings_params)
      redirect_to new_charge_path
    else
      render :edit
    end
  end
  
  private 
  
  def billings_params
    params.require(:billing).permit(:first_name, :last_name, :email, :street, :phone, :city, :state, :zip, :comment, :order_id)
  end
end