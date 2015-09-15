class Order < ActiveRecord::Base
  belongs_to :order_status
  
  has_one :billing
  
  has_many :order_items
  before_create :set_order_status, :create_order_number
  before_save :update_subtotal, :update_total
  
  def subtotal
    order_items.collect { |oi| oi.valid? ? (oi.quantity * oi.unit_price) : 0 }.sum
  end
  
  def shipping
    if order_items.collect { |work| (work.quantity) }.sum > 5
      10
    else
      5
    end
  end
private
  def set_order_status
    self.order_status_id = 1
    self.shipping = 5.00
  end
  
  def update_subtotal
    self[:subtotal] = subtotal
  end
  
  def update_total
    self[:total] = subtotal + shipping
  end
  
def create_order_number
  begin
    self.order_number = SecureRandom.random_number(1000000)
  end while self.class.exists?(:order_number => order_number)
end
end

#SecureRandom.hex(5)
