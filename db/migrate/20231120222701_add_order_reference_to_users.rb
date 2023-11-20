class AddOrderReferenceToUsers < ActiveRecord::Migration[7.0]
  def change
    add_reference :users, :order, null: false, foreign_key: true
  end
end
