class CreateBillings < ActiveRecord::Migration
  def change
    create_table :billings do |t|
      t.string :first_name, :last_name, :email, :city, :state, :phone, :zip
      t.text :street, :comment
      t.references :order, index: true, foreign_key: true  
    end
  end
end
