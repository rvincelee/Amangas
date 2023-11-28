class AddTaxRatesToProvinces < ActiveRecord::Migration[7.0]
  def change
    add_column :provinces, :PST, :decimal
    add_column :provinces, :GST, :decimal
    add_column :provinces, :HST, :decimal
  end
end
