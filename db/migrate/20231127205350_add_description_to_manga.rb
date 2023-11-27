class AddDescriptionToManga < ActiveRecord::Migration[7.0]
  def change
    add_column :mangas, :description, :string, null: true
  end
end
