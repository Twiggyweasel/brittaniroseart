class CreateCustomOrder < ActiveRecord::Migration
  def change
    create_table :custom_order do |t|
      t.string :item; :background; :color; :design; :quote, :custom_quote
      t.integer :quantity;
      t.boolean :approval; :paid; :shipped
  end
end
