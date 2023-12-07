class OrdersAllowNullOnUsersId < ActiveRecord::Migration[7.0]
  def change
    change_column :orders, :user_id, :int, null: true
  end
end
