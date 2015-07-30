class Billing < ActiveRecord::Base
  belongs_to :order
  
  validates :first_name, presence: true
  validates :last_name, presence: true
end