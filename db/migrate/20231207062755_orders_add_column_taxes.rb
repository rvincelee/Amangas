class OrdersAddColumnTaxes < ActiveRecord::Migration[7.0]
  def change
    add_column :orders, :taxes_rate, :decimal
    add_column :orders, :tax_price, :decimal
  end
end
