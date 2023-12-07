class AddColumnPriceToOrderDetails < ActiveRecord::Migration[7.0]
  def change
    add_column :order_details, :price, :decimal
  end
end
