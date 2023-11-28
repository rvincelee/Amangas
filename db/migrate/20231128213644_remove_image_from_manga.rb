class RemoveImageFromManga < ActiveRecord::Migration[7.0]
  def change
    remove_column :mangas, :image, :string
  end
end
