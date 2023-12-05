class AllowNullsOnAddressUser < ActiveRecord::Migration[7.0]
  def change
    change_column :addresses, :user_id, :int, null: true
  end
end
