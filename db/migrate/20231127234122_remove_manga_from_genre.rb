class RemoveMangaFromGenre < ActiveRecord::Migration[7.0]
  def change
    remove_column :genres, :manga_id, :integer
  end
end
