class AllowNullsOnImplicitTables < ActiveRecord::Migration[7.0]
  def change
    change_column :users, :order_id, :int, null: true
    change_column :genres, :manga_id, :int, null: true
  end
end
